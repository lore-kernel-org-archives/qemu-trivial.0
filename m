Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RkJ30-0002Gd-PQ
	for mharc-qemu-trivial@gnu.org; Mon, 09 Jan 2012 12:30:14 -0500
Received: from eggs.gnu.org ([140.186.70.92]:47807)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1RkJ2u-0001y0-6U
	for qemu-trivial@nongnu.org; Mon, 09 Jan 2012 12:30:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1RkJ2p-0001Hi-Ui
	for qemu-trivial@nongnu.org; Mon, 09 Jan 2012 12:30:08 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:42116)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1RkJ2f-0001B1-Ou; Mon, 09 Jan 2012 12:29:53 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	1C97E7280003; Mon,  9 Jan 2012 18:29:52 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id 31t8YW+m8baj; Mon,  9 Jan 2012 18:29:51 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id CC26E7280006; Mon,  9 Jan 2012 18:29:51 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Mon,  9 Jan 2012 18:29:51 +0100
Message-Id: <1326130191-20344-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] Add 'fall through' comments to case
	statements without break
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Jan 2012 17:30:12 -0000

These comments are used by static code analysis tools and in code reviews
to avoid false warnings because of missing break statements.

The case statements handled here were reported by coverity.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 hw/pcnet.c    |    1 +
 json-lexer.c  |    1 +
 qemu-option.c |    4 ++++
 3 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/hw/pcnet.c b/hw/pcnet.c
index cba253b..306dc6e 100644
--- a/hw/pcnet.c
+++ b/hw/pcnet.c
@@ -1505,6 +1505,7 @@ static void pcnet_bcr_writew(PCNetState *s, uint32_t rap, uint32_t val)
 #ifdef PCNET_DEBUG
        printf("BCR_SWS=0x%04x\n", val);
 #endif
+        /* fall through */
     case BCR_LNKST:
     case BCR_LED1:
     case BCR_LED2:
diff --git a/json-lexer.c b/json-lexer.c
index c21338f..3cd3285 100644
--- a/json-lexer.c
+++ b/json-lexer.c
@@ -301,6 +301,7 @@ static int json_lexer_feed_char(JSONLexer *lexer, char ch, bool flush)
         case JSON_KEYWORD:
         case JSON_STRING:
             lexer->emit(lexer, lexer->token, new_state, lexer->x, lexer->y);
+            /* fall through */
         case JSON_SKIP:
             QDECREF(lexer->token);
             lexer->token = qstring_new();
diff --git a/qemu-option.c b/qemu-option.c
index 6b23c31..a303f87 100644
--- a/qemu-option.c
+++ b/qemu-option.c
@@ -214,13 +214,17 @@ static int parse_option_size(const char *name, const char *value, uint64_t *ret)
         switch (*postfix) {
         case 'T':
             sizef *= 1024;
+            /* fall through */
         case 'G':
             sizef *= 1024;
+            /* fall through */
         case 'M':
             sizef *= 1024;
+            /* fall through */
         case 'K':
         case 'k':
             sizef *= 1024;
+            /* fall through */
         case 'b':
         case '\0':
             *ret = (uint64_t) sizef;
-- 
1.7.2.5


