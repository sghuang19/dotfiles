/** Continue config */
// @ts-ignore - can't find type definitions here
import { execSync } from "child_process";

function runShellCommand(command: string): string {
  try {
    return execSync(command, { encoding: "utf8" }).trim();
  } catch (error) {
    console.error(`Error: ${(error as Error).message}`);
    return "";
  }
}

const siliconFlowKey = runShellCommand(
  "op read op://Personal/SiliconFlow/credential"
);

const DSR1 = {
  title: "DeepSeek R1",
  provider: "siliconflow",
  model: "deepseek-ai/DeepSeek-R1",
  apiKey: siliconFlowKey,
  systemMessage:
    "You are an expert software developer. You give helpful and concise responses.",
};

const DSV3 = {
  title: "DeepSeek V3",
  provider: "siliconflow",
  model: "deepseek-ai/DeepSeek-V3",
  apiKey: siliconFlowKey,
  systemMessage:
    "You are an expert software developer. You give helpful and concise responses.",
};

// @ts-ignore
export function modifyConfig(config: Config): Config {
  config.models.push(DSR1);
  config.models.push(DSV3);
  return config;
}
