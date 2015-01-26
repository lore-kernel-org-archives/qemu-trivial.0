Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YFhb8-0004wc-Qu
	for mharc-qemu-trivial@gnu.org; Mon, 26 Jan 2015 06:12:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43384)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1YFhb5-0004rb-RZ
	for qemu-trivial@nongnu.org; Mon, 26 Jan 2015 06:12:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1YFhb4-0001pB-OB
	for qemu-trivial@nongnu.org; Mon, 26 Jan 2015 06:12:47 -0500
Received: from mail-we0-x235.google.com ([2a00:1450:400c:c03::235]:61764)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1YFhb0-0001dg-Al; Mon, 26 Jan 2015 06:12:42 -0500
Received: by mail-we0-f181.google.com with SMTP id k48so8380759wev.12;
	Mon, 26 Jan 2015 03:12:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=f5GvOsDVpGLgOaBIadRSbCIPBldwct8ADANGeW0dv2A=;
	b=sXvx9yDl9GTAHdKhb092OO0pi/8yNUm0moLdYUK+c8s9TqmDJvyGYgDnZXB4ittBG6
	zeLIlMpKohZ5m+IsTcfntF4SKJJT3oP8YL304/k6Ofb4XhB66i+js0zJOVGVMyernBCU
	FFrMqZ2ujPSFLu3m8DuM2jM4qJq1JiHYEtFKUwoD3jnSTXaLmbye9Jypq7Mkf6lZDeqL
	CCv1GP4rLYntisgsdmWBkdWZxxQskyuRYWBBuXEjd5rY1sV/5sFeivD1sYqCkft6Dx5A
	RMPwtH93EzTzZ8Rq/ZPeO3ws505Ufrw/mlaVwh6rIa2J6SGBYJI2uFBJDvOSVSGV4uvv
	lvrw==
X-Received: by 10.194.19.197 with SMTP id h5mr24370178wje.109.1422270761813;
	Mon, 26 Jan 2015 03:12:41 -0800 (PST)
Received: from playground.station (net-2-35-193-154.cust.vodafonedsl.it.
	[2.35.193.154])
	by mx.google.com with ESMTPSA id fp2sm13476390wib.8.2015.01.26.03.12.40
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Jan 2015 03:12:41 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 26 Jan 2015 12:12:25 +0100
Message-Id: <1422270747-23994-6-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1422270747-23994-1-git-send-email-pbonzini@redhat.com>
References: <1422270747-23994-1-git-send-email-pbonzini@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c03::235
Cc: qemu-trivial@nongnu.org, armbru@redhat.com
Subject: [Qemu-trivial] [PATCH 5/7] cutils: refine strtol error handling in
	parse_debug_env
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

Avoid truncation of a 64-bit long to a 32-bit int, and check for errno
(especially ERANGE).

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/cutils.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/util/cutils.c b/util/cutils.c
index dbe7412..f227064 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -523,7 +523,7 @@ int parse_debug_env(const char *name, int max, int initial)
 {
     char *debug_env = getenv(name);
     char *inv = NULL;
-    int debug;
+    long debug;
 
     if (!debug_env) {
         return initial;
@@ -532,7 +532,7 @@ int parse_debug_env(const char *name, int max, int initial)
     if (inv == debug_env) {
         return initial;
     }
-    if (debug < 0 || debug > max) {
+    if (debug < 0 || debug > max || errno != 0) {
         fprintf(stderr, "warning: %s not in [0, %d]", name, max);
         return initial;
     }
-- 
1.8.3.1



