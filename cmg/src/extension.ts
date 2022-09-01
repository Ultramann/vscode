import * as os from 'os';
import * as fs from 'fs';
import * as path from 'path';
import * as vscode from 'vscode';

const touch = (path: string) => {
	const time = new Date();
	try {
		fs.utimesSync(path, time, time);
	} catch (err) {
		fs.closeSync(fs.openSync(path, 'w'));
	}
};

const workspaceDir = (): string => {
	let wsFolder = vscode.workspace.workspaceFolders && vscode.workspace.workspaceFolders[0];
	return wsFolder?.uri.fsPath || os.homedir();
};

const openFile = (filePath: string, workspace: boolean = false) => {
	let baseFileDir = workspace ? workspaceDir() : os.homedir();
	let fullFilePath = path.join(baseFileDir, filePath);
	let fileDir = path.dirname(fullFilePath);
	if (!fs.existsSync(fileDir)) {
		fs.mkdirSync(fileDir);
	}
	touch(fullFilePath);
	let fileUri = vscode.Uri.file(fullFilePath);
	vscode.workspace.openTextDocument(fileUri).then(doc => {
		vscode.window.showTextDocument(doc);
	});
};

const openNote = (workspace: boolean) => {
	let options: vscode.InputBoxOptions = {
		prompt: "Note Name",
	};
	vscode.window.showInputBox(options).then(value => {
		if (!value) {
			return;
		}
		openFile(path.join("notes", value + ".md"), workspace);
	});
};

// this method is called when your extension is activated
// your extension is activated the very first time the command is executed
export function activate(context: vscode.ExtensionContext) {
	context.subscriptions.push(
		vscode.commands.registerCommand('cmg.openFile', openFile)
	);
	context.subscriptions.push(
		vscode.commands.registerCommand('cmg.openNote', openNote)
	);
}

// this method is called when your extension is deactivated
export function deactivate() { }
