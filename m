Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YFhb9-0004wv-0b
	for mharc-qemu-trivial@gnu.org; Mon, 26 Jan 2015 06:12:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43272)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1YFhb0-0004jp-KL
	for qemu-trivial@nongnu.org; Mon, 26 Jan 2015 06:12:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1YFhay-0001ao-Up
	for qemu-trivial@nongnu.org; Mon, 26 Jan 2015 06:12:41 -0500
Received: from mail-wg0-x231.google.com ([2a00:1450:400c:c00::231]:46840)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1YFhaw-0001Tk-RI; Mon, 26 Jan 2015 06:12:38 -0500
Received: by mail-wg0-f49.google.com with SMTP id k14so8339418wgh.8;
	Mon, 26 Jan 2015 03:12:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=gRE6aOtyE2OheZO24gr8HNzhRvx7HbsUHa18WPav7yw=;
	b=zoG2i5mXSCecLJ+jtlJi7JfVwu6iZcNcwELjfBZx74vDSX5Ok8Hs4HPQ0BEKVani2c
	oMWA1IpsNfbQRZd4qCl1hz2RuwI0xN9/3lXCVzqqO/A0ddsODTLn/RNiOJwgXhIagU2I
	FiCOaFxFZk2jN4JgzP3g8RtbX+uONlEXLiwwmp2ugvL3PQlIpfMbAid0+feLS1NdFgf+
	lfBAVOYq4jvOb5hf0p5yQlLk5OHIiLq5zuj/bQ9L3bIbCcFrxIMn0faQzoyQaZCKv7NB
	vuvBlpSGDMZkOV9f8D6rFcbnAVog4frA7MtG+qCLEOV+sdpxC3oKaLja+yiQ8Wp2UyJP
	ueig==
X-Received: by 10.194.175.39 with SMTP id bx7mr43519162wjc.22.1422270758330;
	Mon, 26 Jan 2015 03:12:38 -0800 (PST)
Received: from playground.station (net-2-35-193-154.cust.vodafonedsl.it.
	[2.35.193.154])
	by mx.google.com with ESMTPSA id fp2sm13476390wib.8.2015.01.26.03.12.36
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Jan 2015 03:12:37 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 26 Jan 2015 12:12:23 +0100
Message-Id: <1422270747-23994-4-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1422270747-23994-1-git-send-email-pbonzini@redhat.com>
References: <1422270747-23994-1-git-send-email-pbonzini@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c00::231
Cc: qemu-trivial@nongnu.org, armbru@redhat.com
Subject: [Qemu-trivial] [PATCH 3/7] uri: avoid NULL arguments to strcmp
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
X-List-Received-Date: Mon, 26 Jan 2015 11:12:49 -0000

Detected by Coverity.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/uri.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/util/uri.c b/util/uri.c
index 918d235..014d40d 100644
--- a/util/uri.c
+++ b/util/uri.c
@@ -1971,7 +1971,9 @@ uri_resolve_relative (const char *uri, const char * base)
 	val = g_strdup (uri);
 	goto done;
     }
-    if (!strcmp(bas->path, ref->path)) {
+    if (bas->path == ref->path ||
+        (bas->path != NULL && ref->path != NULL &&
+         !strcmp(bas->path, ref->path))) {
 	val = g_strdup("");
 	goto done;
     }
-- 
1.8.3.1



