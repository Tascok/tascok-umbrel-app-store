# Tascok's Umbrel App Store ☂️

Loja de aplicativos da comunidade para [Umbrel](https://umbrel.com). Esta loja é independente e não é mantida nem endossada pela equipe oficial do Umbrel.

Todas as atualizações e o gerenciamento dos apps desta loja são feitos de forma independente.

## 📦 Apps disponíveis

**329 aplicativos** disponíveis, cobrindo mídia, finanças, produtividade, ferramentas de desenvolvedor, jogos, monitoramento e muito mais.

## 🚀 Como adicionar a loja no seu Umbrel

1. No Umbrel, abra a **App Store**
2. Clique nos **três pontinhos (⋮)** no canto superior direito
3. Selecione **Community App Stores**
4. Cole a URL do repositório:

```
https://github.com/Tascok/tascok-umbrel-app-store
```

5. Clique em **Add** e a loja **Tascok's Umbrel App Store** aparecerá na sua interface

> Alternativa: em **Settings → Advanced Settings → App Gallery / Community App Store**, dependendo da versão do Umbrel.

## ⚠️ Avisos importantes

- Apps de comunidade não passam por revisão da equipe Umbrel. Use por sua conta e leia cada app antes de instalar.
- Os ícones e screenshots da galeria ainda são servidos a partir do repositório de galeria original (`dennysubke/dennys-umbrel-app-gallery`). Para independência total, faça fork daquele repositório e atualize as URLs de `icon:` e `gallery:` nos `umbrel-app.yml` dos apps.
- Algumas imagens Docker usadas pelos compose são publicadas por terceiros (incluindo o autor da loja original). Para controle total, publique suas próprias imagens.

## 📁 Estrutura

```
tascok-<app>/
├── umbrel-app.yml     # manifest do app (nome, id, porta, descrição, galeria)
├── docker-compose.yml # serviços docker do app
└── ...                # arquivos de configuração específicos
umbrel-app-store.yml   # manifest da loja
```

## 🙏 Créditos

Base para esta loja: [dennys-umbrel-app-store](https://github.com/dennysubke/dennys-umbrel-app-store) — trabalho original de [@dennysubke](https://github.com/dennysubke). Considere apoiar o autor original (link no repositório dele).
