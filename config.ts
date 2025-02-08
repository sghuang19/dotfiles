/** Continue config */

// @ts-ignore - can't find type definitions here
import { execSync } from "child_process";

const runShellCommand = (command: string): string => {
  try {
    return execSync(command, { encoding: "utf8" }).trim();
  } catch (error) {
    console.error("Error:", error);
    return "";
  }
};

const siliconFlowKey = runShellCommand(
  "op read op://Personal/SiliconFlow/credential"
);
const voyageKey = runShellCommand(
  "op read 'op://Personal/Voyage AI/credential'"
);

const DS: Partial<ModelDescription> & { provider: string } = {
  provider: "siliconflow",
  model: "deepseek-ai/DeepSeek-V3",
  apiKey: siliconFlowKey,
};

const DSV3: ModelDescription = {
  ...DS,
  title: "DeepSeek V3",
  model: "deepseek-ai/DeepSeek-V3",
  systemMessage:
    "You are an expert software developer. You give helpful and concise responses.",
};

const DSR1: ModelDescription = {
  ...DS,
  title: "DeepSeek R1",
  model: "deepseek-ai/DeepSeek-R1",
  systemMessage:
    "You are an expert software developer. You give helpful and concise responses.",
};

const DSV25: ModelDescription = {
  title: "DeepSeek V2.5",
  provider: "siliconflow",
  model: "deepseek-ai/DeepSeek-V2.5",
  apiKey: siliconFlowKey,
};

const VoyageCode3: EmbeddingsProviderDescription = {
  provider: "voyage",
  model: "voyage-code-3",
  apiKey: voyageKey,
};

export function modifyConfig(config: Config): Config {
  config.models.push(DSR1);
  config.models.push(DSV3);
  config.tabAutocompleteModel = DSV25;
  config.embeddingsProvider = VoyageCode3;
  config.reranker = {
    name: "voyage",
    params: {
      model: "rerank-2",
      apiKey: voyageKey,
    },
  } as RerankerDescription;
  return config;
}
