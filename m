Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QQ0mg-0000ux-Fx
	for mharc-qemu-trivial@gnu.org; Fri, 27 May 2011 13:25:14 -0400
Received: from eggs.gnu.org ([140.186.70.92]:33185)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cerbere@gmail.com>) id 1QQ0me-0000pq-Go
	for qemu-trivial@nongnu.org; Fri, 27 May 2011 13:25:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cerbere@gmail.com>) id 1QQ0md-0003hL-RY
	for qemu-trivial@nongnu.org; Fri, 27 May 2011 13:25:12 -0400
Received: from mail-qy0-f180.google.com ([209.85.216.180]:47383)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cerbere@gmail.com>)
	id 1QQ0mc-0003gn-6v; Fri, 27 May 2011 13:25:10 -0400
Received: by qyk10 with SMTP id 10so1297100qyk.4
	for <multiple recipients>; Fri, 27 May 2011 10:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:mime-version:content-type
	:content-transfer-encoding;
	bh=5a7BfT+znAKcUkL7p7DhRVE9u1EKbXSnnh3UYpxqn78=;
	b=MxfdJosw1AWWwRmQdNscDe6sSnArwhj78hP/zD77V5OEcJqZOXXP4SV1qfbQxUKIrW
	jv+LhiIAwXNzDAVGYPASrnqCV/SSvkeKtx88MXUO/hWRqMiWuu1TBDoIF+GJlWh/C16u
	ZXOHXZOQu72CuSjLGP1QW9BUtpmOqWe525/k0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	b=XIEg7y5fmQKDyZFPsemyPFXkyypGjtB04l9AjrxoMmLVsKLenpF/6XAuYnYbuAvgDP
	pllUHX8a6weC3IllDo/WixjkBbcdfnwSUD9YGl3QppAYMoUrw8Ev0p9paGzv4d33Podc
	SRQF/8hibDLc7WwEHMxsVio4KK6sXX9UifNdQ=
Received: by 10.224.135.198 with SMTP id o6mr1779502qat.87.1306517109917;
	Fri, 27 May 2011 10:25:09 -0700 (PDT)
Received: from localhost.localdomain (modemcable055.201-23-96.mc.videotron.ca
	[96.23.201.55])
	by mx.google.com with ESMTPS id e28sm1198569qck.30.2011.05.27.10.25.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 May 2011 10:25:09 -0700 (PDT)
From: Alexandre Raymond <cerbere@gmail.com>
To: qemu-devel@nongnu.org
Date: Fri, 27 May 2011 13:22:28 -0400
Message-Id: <1306516951-31105-4-git-send-email-cerbere@gmail.com>
X-Mailer: git-send-email 1.7.5
In-Reply-To: <1306516951-31105-1-git-send-email-cerbere@gmail.com>
References: <1306516951-31105-1-git-send-email-cerbere@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.216.180
Cc: qemu-trivial@nongnu.org, Alexandre Raymond <cerbere@gmail.com>
Subject: [Qemu-trivial] [PATCH 3/6] Fix compilation warning due to
	incorrectly specified type
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
X-List-Received-Date: Fri, 27 May 2011 17:25:13 -0000

In audio/coreaudio.c, a variable named "str" was assigned "const char" values,
which resulted in the following warnings:

-----8<-----
audio/coreaudio.c: In function ‘coreaudio_logstatus’:
audio/coreaudio.c:59: warning: initialization discards qualifiers from pointer target type
audio/coreaudio.c:63: warning: assignment discards qualifiers from pointer target type
(...)
-----8<-----

Signed-off-by: Alexandre Raymond <cerbere@gmail.com>
---
 audio/coreaudio.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/audio/coreaudio.c b/audio/coreaudio.c
index 0a26413..3bd75cd 100644
--- a/audio/coreaudio.c
+++ b/audio/coreaudio.c
@@ -56,7 +56,7 @@ typedef struct coreaudioVoiceOut {
 
 static void coreaudio_logstatus (OSStatus status)
 {
-    char *str = "BUG";
+    const char *str = "BUG";
 
     switch(status) {
     case kAudioHardwareNoError:
-- 
1.7.5


