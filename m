Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZNNcO-0003JU-4Z
	for mharc-qemu-trivial@gnu.org; Thu, 06 Aug 2015 12:02:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41794)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <grangeleo@gmail.com>) id 1ZNNEj-0007ED-22
	for qemu-trivial@nongnu.org; Thu, 06 Aug 2015 11:37:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <grangeleo@gmail.com>) id 1ZNNEd-0006uL-7M
	for qemu-trivial@nongnu.org; Thu, 06 Aug 2015 11:37:41 -0400
Received: from mail-wi0-x22a.google.com ([2a00:1450:400c:c05::22a]:35412)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <grangeleo@gmail.com>) id 1ZNNEd-0006tY-0F
	for qemu-trivial@nongnu.org; Thu, 06 Aug 2015 11:37:35 -0400
Received: by wibxm9 with SMTP id xm9so27757269wib.0
	for <qemu-trivial@nongnu.org>; Thu, 06 Aug 2015 08:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=l6LDHfuw33JpNbGUqebtIdmLykEGv+6AFTJRJlgLJxg=;
	b=TRMNIMElRgd990UNc7boyWERdqrKtD+u0bRBgjIoazEilCn09SuSFpoW5skBNdrMni
	nZYst0+Dtt9Y79qcKyySB+Es1i8jK6gYKCrJXY7RJjozhg9DOV2JCyaxLFsGe6uQvTPa
	fcSbGBVU64zH8hXfSD6kOL869ZPWgMr9EmcjWkTLg/yn1PZpFmBuMudVB3sGCajEUsIV
	NjTRw4FHLuNCn1VuhOqr/+Ev75yyyDeLkL3TylwOONbjo/NPovRWoWUwb9UkXGZ1y8oV
	AQDSJOOfSIIlKRB561lzMTNtM3Ojv5E+yQf6D94EeXtZztPHJleEc0Elb+GXdV7G4Mxb
	S2AQ==
X-Received: by 10.180.85.74 with SMTP id f10mr7208746wiz.45.1438875453202;
	Thu, 06 Aug 2015 08:37:33 -0700 (PDT)
Received: from niicer.localdomain (85-171-249-45.rev.numericable.fr.
	[85.171.249.45]) by smtp.gmail.com with ESMTPSA id
	bu12sm10059605wjb.44.2015.08.06.08.37.32
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Aug 2015 08:37:32 -0700 (PDT)
From: Leo Grange <grangeleo@gmail.com>
To: qemu-trivial@nongnu.org
Date: Thu,  6 Aug 2015 17:36:32 +0200
Message-Id: <1438875392-9620-1-git-send-email-grangeleo@gmail.com>
X-Mailer: git-send-email 2.5.0
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::22a
X-Mailman-Approved-At: Thu, 06 Aug 2015 12:02:04 -0400
Cc: Leo Grange <grangeleo@gmail.com>, kraxel@redhat.com
Subject: [Qemu-trivial] [PATCH][TRIVIAL] spice: fix checking for surface bpp
	match
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
X-List-Received-Date: Thu, 06 Aug 2015 15:37:42 -0000

Spice surface_switch fast-path was checking only width/height matching,
which leads to a crash when surface bpp has been increased but size
didn't change (and probably other issues if bpp has been decreased).

Signed-off-by: Leo Grange <grangeleo@gmail.com>
---
 ui/spice-display.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/ui/spice-display.c b/ui/spice-display.c
index 0360abf..d1e0972 100644
--- a/ui/spice-display.c
+++ b/ui/spice-display.c
@@ -406,10 +406,11 @@ void qemu_spice_display_switch(SimpleSpiceDisplay *ssd,
     SimpleSpiceUpdate *update;
     bool need_destroy;
 
-    if (surface && ssd->surface &&
+    if (surface && ssd->surface && ssd->ds &&
         surface_width(surface) == pixman_image_get_width(ssd->surface) &&
-        surface_height(surface) == pixman_image_get_height(ssd->surface)) {
-        /* no-resize fast path: just swap backing store */
+        surface_height(surface) == pixman_image_get_height(ssd->surface) &&
+		surface_bits_per_pixel(surface) == surface_bits_per_pixel(ssd->ds)) {
+        /* no-resize and no bpp change fast path: just swap backing store */
         dprint(1, "%s/%d: fast (%dx%d)\n", __func__, ssd->qxl.id,
                surface_width(surface), surface_height(surface));
         qemu_mutex_lock(&ssd->lock);
-- 
2.5.0


