using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using ModelContextProtocol.Server;
using System.ComponentModel;

var builder = Host.CreateApplicationBuilder(args);
builder.Services
    .AddMcpServer()
    .WithStdioServerTransport()
    .WithToolsFromAssembly();

await builder.Build().RunAsync();

[McpServerToolType]
public static class FileTools
{
    [McpServerTool]
    [Description("Create a file with the given content")]
    public static string CreateFile(
        [Description("File path to create")] string path,
        [Description("Content to write")] string content)
    {
        var fullPath = Path.GetFullPath(path);
        File.WriteAllText(fullPath, content);
        return $"Created: {fullPath}";
    }
}
