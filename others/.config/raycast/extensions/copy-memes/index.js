"use strict";
var __create = Object.create;
var __defProp = Object.defineProperty;
var __getOwnPropDesc = Object.getOwnPropertyDescriptor;
var __getOwnPropNames = Object.getOwnPropertyNames;
var __getProtoOf = Object.getPrototypeOf;
var __hasOwnProp = Object.prototype.hasOwnProperty;
var __export = (target, all) => {
  for (var name in all)
    __defProp(target, name, { get: all[name], enumerable: true });
};
var __copyProps = (to, from, except, desc) => {
  if (from && typeof from === "object" || typeof from === "function") {
    for (let key of __getOwnPropNames(from))
      if (!__hasOwnProp.call(to, key) && key !== except)
        __defProp(to, key, { get: () => from[key], enumerable: !(desc = __getOwnPropDesc(from, key)) || desc.enumerable });
  }
  return to;
};
var __toESM = (mod, isNodeMode, target) => (target = mod != null ? __create(__getProtoOf(mod)) : {}, __copyProps(
  isNodeMode || !mod || !mod.__esModule ? __defProp(target, "default", { value: mod, enumerable: true }) : target,
  mod
));
var __toCommonJS = (mod) => __copyProps(__defProp({}, "__esModule", { value: true }), mod);

// src/index.tsx
var src_exports = {};
__export(src_exports, {
  default: () => Command
});
module.exports = __toCommonJS(src_exports);
var import_api = require("@raycast/api");
var fs = __toESM(require("fs"));
var child_process = __toESM(require("child_process"));
var import_jsx_runtime = require("react/jsx-runtime");
var MEMES_DIRECTORY = "/Users/gianu/Dropbox/Public/meme";
function Command() {
  const files = fs.readdirSync(MEMES_DIRECTORY).filter((file) => file !== ".DS_Store");
  const items = files.map((file) => {
    const fileName = `${MEMES_DIRECTORY}/${file}`;
    return /* @__PURE__ */ (0, import_jsx_runtime.jsx)(import_api.List.Item, {
      id: file,
      icon: fileName,
      title: file,
      actions: /* @__PURE__ */ (0, import_jsx_runtime.jsx)(import_api.ActionPanel, {
        children: /* @__PURE__ */ (0, import_jsx_runtime.jsx)(import_api.Action, {
          title: "Copy to clipboard",
          onAction: () => {
            console.log("here!!!");
            pbcopy(fs.readFileSync(fileName));
            console.log("copied");
          }
        })
      })
    }, file);
  });
  return /* @__PURE__ */ (0, import_jsx_runtime.jsx)(import_api.List, {
    children: items
  });
}
function pbcopy(data) {
  const proc = child_process.spawn("pbcopy");
  proc.stdin.write(data);
  proc.stdin.end();
}
// Annotate the CommonJS export names for ESM import in node:
0 && (module.exports = {});
//# sourceMappingURL=data:application/json;base64,ewogICJ2ZXJzaW9uIjogMywKICAic291cmNlcyI6IFsiLi4vLi4vLi4vLi4vd29yay9yYXljYXN0LWNvcHktbWVtZS9jb3B5LW1lbWVzL3NyYy9pbmRleC50c3giXSwKICAic291cmNlc0NvbnRlbnQiOiBbImltcG9ydCB7IEFjdGlvblBhbmVsLCBEZXRhaWwsIExpc3QsIEFjdGlvbiB9IGZyb20gXCJAcmF5Y2FzdC9hcGlcIjtcbmltcG9ydCAqIGFzIGZzIGZyb20gXCJmc1wiO1xuaW1wb3J0ICogYXMgY2hpbGRfcHJvY2VzcyBmcm9tIFwiY2hpbGRfcHJvY2Vzc1wiO1xuXG5jb25zdCBNRU1FU19ESVJFQ1RPUlkgPSBcIi9Vc2Vycy9naWFudS9Ecm9wYm94L1B1YmxpYy9tZW1lXCI7XG5cbmV4cG9ydCBkZWZhdWx0IGZ1bmN0aW9uIENvbW1hbmQoKSB7XG4gIGNvbnN0IGZpbGVzID0gZnMucmVhZGRpclN5bmMoTUVNRVNfRElSRUNUT1JZKS5maWx0ZXIoKGZpbGUpID0+IGZpbGUgIT09IFwiLkRTX1N0b3JlXCIpO1xuXG4gIGNvbnN0IGl0ZW1zID0gZmlsZXMubWFwKChmaWxlKSA9PiB7XG4gICAgY29uc3QgZmlsZU5hbWUgPSBgJHtNRU1FU19ESVJFQ1RPUll9LyR7ZmlsZX1gO1xuICAgIHJldHVybiAoXG4gICAgICA8TGlzdC5JdGVtXG4gICAgICAgIGtleT17ZmlsZX1cbiAgICAgICAgaWQ9e2ZpbGV9XG4gICAgICAgIGljb249e2ZpbGVOYW1lfVxuICAgICAgICB0aXRsZT17ZmlsZX1cbiAgICAgICAgYWN0aW9ucz17XG4gICAgICAgICAgPEFjdGlvblBhbmVsPlxuICAgICAgICAgICAgPEFjdGlvblxuICAgICAgICAgICAgICB0aXRsZT1cIkNvcHkgdG8gY2xpcGJvYXJkXCJcbiAgICAgICAgICAgICAgb25BY3Rpb249eygpID0+IHtcbiAgICAgICAgICAgICAgICBjb25zb2xlLmxvZyhcImhlcmUhISFcIik7XG4gICAgICAgICAgICAgICAgcGJjb3B5KGZzLnJlYWRGaWxlU3luYyhmaWxlTmFtZSkpO1xuICAgICAgICAgICAgICAgIGNvbnNvbGUubG9nKFwiY29waWVkXCIpO1xuICAgICAgICAgICAgICB9fVxuICAgICAgICAgICAgLz5cbiAgICAgICAgICA8L0FjdGlvblBhbmVsPlxuICAgICAgICB9XG4gICAgICAvPlxuICAgICk7XG4gIH0pO1xuICByZXR1cm4gKFxuICAgIDxMaXN0PlxuICAgICAge2l0ZW1zfVxuICAgICAgey8qIDxMaXN0Lkl0ZW1cbiAgICAgICAgaWNvbj1cImxpc3QtaWNvbi5wbmdcIlxuICAgICAgICB0aXRsZT1cIkdyZWV0aW5nXCJcbiAgICAgICAgYWN0aW9ucz17XG4gICAgICAgICAgPEFjdGlvblBhbmVsPlxuICAgICAgICAgICAgPEFjdGlvbi5QdXNoIHRpdGxlPVwiU2hvdyBEZXRhaWxzXCIgdGFyZ2V0PXs8RGV0YWlsIG1hcmtkb3duPVwiIyBIZXkhIFx1RDgzRFx1REM0QlwiIC8+fSAvPlxuICAgICAgICAgIDwvQWN0aW9uUGFuZWw+XG4gICAgICAgIH1cbiAgICAgIC8+ICovfVxuICAgIDwvTGlzdD5cbiAgKTtcbn1cblxuZnVuY3Rpb24gcGJjb3B5KGRhdGE6IHVua25vd24pIHtcbiAgY29uc3QgcHJvYyA9IGNoaWxkX3Byb2Nlc3Muc3Bhd24oXCJwYmNvcHlcIik7XG4gIHByb2Muc3RkaW4ud3JpdGUoZGF0YSk7XG4gIHByb2Muc3RkaW4uZW5kKCk7XG59XG4iXSwKICAibWFwcGluZ3MiOiAiOzs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7OztBQUFBO0FBQUE7QUFBQTtBQUFBO0FBQUE7QUFBQSxpQkFBa0Q7QUFDbEQsU0FBb0I7QUFDcEIsb0JBQStCO0FBRi9CO0FBSUEsSUFBTSxrQkFBa0I7QUFFVCxTQUFSLFVBQTJCO0FBQ2hDLFFBQU0sUUFBVyxlQUFZLGVBQWUsRUFBRSxPQUFPLENBQUMsU0FBUyxTQUFTLFdBQVc7QUFFbkYsUUFBTSxRQUFRLE1BQU0sSUFBSSxDQUFDLFNBQVM7QUFDaEMsVUFBTSxXQUFXLEdBQUcsbUJBQW1CO0FBQ3ZDLFdBQ0UsNENBQUMsZ0JBQUssTUFBTDtBQUFBLE1BRUMsSUFBSTtBQUFBLE1BQ0osTUFBTTtBQUFBLE1BQ04sT0FBTztBQUFBLE1BQ1AsU0FDRSw0Q0FBQztBQUFBLFFBQ0Msc0RBQUM7QUFBQSxVQUNDLE9BQU07QUFBQSxVQUNOLFVBQVUsTUFBTTtBQUNkLG9CQUFRLElBQUksU0FBUztBQUNyQixtQkFBVSxnQkFBYSxRQUFRLENBQUM7QUFDaEMsb0JBQVEsSUFBSSxRQUFRO0FBQUEsVUFDdEI7QUFBQSxTQUNGO0FBQUEsT0FDRjtBQUFBLE9BZEcsSUFnQlA7QUFBQSxFQUVKLENBQUM7QUFDRCxTQUNFLDRDQUFDO0FBQUEsSUFDRTtBQUFBLEdBVUg7QUFFSjtBQUVBLFNBQVMsT0FBTyxNQUFlO0FBQzdCLFFBQU0sT0FBcUIsb0JBQU0sUUFBUTtBQUN6QyxPQUFLLE1BQU0sTUFBTSxJQUFJO0FBQ3JCLE9BQUssTUFBTSxJQUFJO0FBQ2pCOyIsCiAgIm5hbWVzIjogW10KfQo=
