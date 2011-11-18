Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RRS4H-0006bY-2W
	for mharc-qemu-trivial@gnu.org; Fri, 18 Nov 2011 12:17:37 -0500
Received: from eggs.gnu.org ([140.186.70.92]:40433)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1RRS4B-0006EE-2h
	for qemu-trivial@nongnu.org; Fri, 18 Nov 2011 12:17:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1RRS47-0002Zy-1r
	for qemu-trivial@nongnu.org; Fri, 18 Nov 2011 12:17:31 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:42143)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1RRS3y-0002YC-Ig; Fri, 18 Nov 2011 12:17:18 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	381EF7281888; Fri, 18 Nov 2011 18:17:07 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id Yk5gKaYZKoCp; Fri, 18 Nov 2011 18:16:37 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id D31A77281889; Fri, 18 Nov 2011 18:16:37 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: malc <av1474@comtv.ru>
Date: Fri, 18 Nov 2011 18:16:20 +0100
Message-Id: <1321636580-5478-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] fmodaudio: Remove unused variable 'bits16'
	(reported by cppcheck)
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
X-List-Received-Date: Fri, 18 Nov 2011 17:17:35 -0000

The variable is assigned a value which is never used,
so remove variable and assignment.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 audio/fmodaudio.c |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/audio/fmodaudio.c b/audio/fmodaudio.c
index c34cf53..fabf84d 100644
--- a/audio/fmodaudio.c
+++ b/audio/fmodaudio.c
@@ -343,7 +343,7 @@ static void fmod_fini_out (HWVoiceOut *hw)
 
 static int fmod_init_out (HWVoiceOut *hw, struct audsettings *as)
 {
-    int bits16, mode, channel;
+    int mode, channel;
     FMODVoiceOut *fmd = (FMODVoiceOut *) hw;
     struct audsettings obt_as = *as;
 
@@ -374,7 +374,6 @@ static int fmod_init_out (HWVoiceOut *hw, struct audsettings *as)
     /* FMOD always operates on little endian frames? */
     obt_as.endianness = 0;
     audio_pcm_init_info (&hw->info, &obt_as);
-    bits16 = (mode & FSOUND_16BITS) != 0;
     hw->samples = conf.nb_samples;
     return 0;
 }
@@ -405,7 +404,7 @@ static int fmod_ctl_out (HWVoiceOut *hw, int cmd, ...)
 
 static int fmod_init_in (HWVoiceIn *hw, struct audsettings *as)
 {
-    int bits16, mode;
+    int mode;
     FMODVoiceIn *fmd = (FMODVoiceIn *) hw;
     struct audsettings obt_as = *as;
 
@@ -432,7 +431,6 @@ static int fmod_init_in (HWVoiceIn *hw, struct audsettings *as)
     /* FMOD always operates on little endian frames? */
     obt_as.endianness = 0;
     audio_pcm_init_info (&hw->info, &obt_as);
-    bits16 = (mode & FSOUND_16BITS) != 0;
     hw->samples = conf.nb_samples;
     return 0;
 }
-- 
1.7.2.5


