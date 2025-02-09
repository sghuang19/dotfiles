/** Continue config */

/** Fetch Secrets */

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
  "op read op://dev/silicon-flow/continue"
);
const voyageKey = runShellCommand("op read 'op://dev/voyage-ai/credential'");
const anthropicKey = runShellCommand("op read 'op://dev/anthropic/continue'");

/** Model Definitions */

const promptCode =
  "You are an expert software developer. You give helpful and concise responses.";

const promptChat = "You are a helpful assistant.";

/** Chat Models */

const SiliconFlow: Partial<ModelDescription> & { provider: string } = {
  provider: "siliconflow",
  apiKey: siliconFlowKey,
};

const DSV3: ModelDescription = {
  ...SiliconFlow,
  title: "DeepSeek V3",
  model: "deepseek-ai/DeepSeek-V3",
  systemMessage: promptCode,
};

const DSV3Pro: ModelDescription = {
  ...SiliconFlow,
  title: "DeepSeek V3 - Pro",
  model: "Pro/deepseek-ai/DeepSeek-V3",
  systemMessage: promptCode,
};

const DSV3Chat: ModelDescription = {
  ...DSV3,
  title: "DeepSeek V3 - Chat",
  systemMessage: promptChat,
};

const DSR1: ModelDescription = {
  ...SiliconFlow,
  title: "DeepSeek R1",
  model: "deepseek-ai/DeepSeek-R1",
  systemMessage: promptCode,
};

const DSR1Pro: ModelDescription = {
  ...SiliconFlow,
  title: "DeepSeek R1 - Pro",
  model: "Pro/deepseek-ai/DeepSeek-R1",
  systemMessage: promptCode,
};

const DSR1Chat: ModelDescription = {
  ...DSR1,
  title: "DeepSeek R1 - Chat",
  systemMessage: promptChat,
};

const DSV25: ModelDescription = {
  ...SiliconFlow,
  title: "DeepSeek V2.5",
  model: "deepseek-ai/DeepSeek-V2.5",
};

const ClaudeSonnet: ModelDescription = {
  title: "Claude 3.5 Sonnet",
  provider: "anthropic",
  model: "claude-3-5-sonnet-latest",
  apiKey: anthropicKey,
  systemMessage: promptCode,
  cacheBehavior: {
    cacheSystemMessage: true,
    cacheConversation: true,
  },
};

/** Embeddings Provider */

const BGEM3: EmbeddingsProviderDescription = {
  ...SiliconFlow,
  model: "BAAI/bge-m3",
};

const VoyageCode3: EmbeddingsProviderDescription = {
  provider: "voyage",
  model: "voyage-code-3",
  apiKey: voyageKey,
};

/** Reranker */

const BGERerankerV2M3: RerankerDescription = {
  name: "bge",
  params: {
    model: "BAAI/reranker-v2-m3",
    apiKey: siliconFlowKey,
  },
};

const VoyageRerank2: RerankerDescription = {
  name: "voyage",
  params: {
    model: "rerank-2",
    apiKey: voyageKey,
  },
};

export function modifyConfig(config: Config): Config {
  [DSV3, DSR1, ClaudeSonnet, DSV3Chat, DSR1Chat].forEach((model) =>
    config.models.push(model)
  );
  config.tabAutocompleteModel = DSV25;
  config.embeddingsProvider = BGEM3;
  config.reranker = VoyageRerank2;
  return config;
}
