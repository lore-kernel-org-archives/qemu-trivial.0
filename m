Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z70IF-0006YA-7K
	for mharc-qemu-trivial@gnu.org; Mon, 22 Jun 2015 07:53:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60765)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z70I9-0006NA-6a
	for qemu-trivial@nongnu.org; Mon, 22 Jun 2015 07:53:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z70I8-0000Qo-45
	for qemu-trivial@nongnu.org; Mon, 22 Jun 2015 07:53:32 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:53174)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Z70I2-0000Nm-7z; Mon, 22 Jun 2015 07:53:26 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id E7EE941E4F;
	Mon, 22 Jun 2015 14:53:24 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 22A39A68;
	Mon, 22 Jun 2015 14:16:32 +0300 (MSK)
Received: (nullmailer pid 9266 invoked by uid 1000);
	Mon, 22 Jun 2015 11:16:30 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 22 Jun 2015 14:16:20 +0300
Message-Id: <79fed87d974dde83af01003c4847210fdfb6e5e0.1434971627.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1434971627.git.mjt@msgid.tls.msk.ru>
References: <cover.1434971627.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Frediano Ziglio <fziglio@redhat.com>
Subject: [Qemu-trivial] [PULL 13/21] hw/display/qxl-logger.c: Constify some
	variable
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
X-List-Received-Date: Mon, 22 Jun 2015 11:53:34 -0000

From: Frediano Ziglio <fziglio@redhat.com>

Signed-off-by: Frediano Ziglio <fziglio@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/display/qxl-logger.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/display/qxl-logger.c b/hw/display/qxl-logger.c
index c900c2c..d944d3f 100644
--- a/hw/display/qxl-logger.c
+++ b/hw/display/qxl-logger.c
@@ -22,7 +22,7 @@
 #include "qemu/timer.h"
 #include "qxl.h"
 
-static const char *qxl_type[] = {
+static const char *const qxl_type[] = {
     [ QXL_CMD_NOP ]     = "nop",
     [ QXL_CMD_DRAW ]    = "draw",
     [ QXL_CMD_UPDATE ]  = "update",
@@ -31,7 +31,7 @@ static const char *qxl_type[] = {
     [ QXL_CMD_SURFACE ] = "surface",
 };
 
-static const char *qxl_draw_type[] = {
+static const char *const qxl_draw_type[] = {
     [ QXL_DRAW_NOP         ] = "nop",
     [ QXL_DRAW_FILL        ] = "fill",
     [ QXL_DRAW_OPAQUE      ] = "opaque",
@@ -48,7 +48,7 @@ static const char *qxl_draw_type[] = {
     [ QXL_DRAW_ALPHA_BLEND ] = "alpha-blend",
 };
 
-static const char *qxl_draw_effect[] = {
+static const char *const qxl_draw_effect[] = {
     [ QXL_EFFECT_BLEND            ] = "blend",
     [ QXL_EFFECT_OPAQUE           ] = "opaque",
     [ QXL_EFFECT_REVERT_ON_DUP    ] = "revert-on-dup",
@@ -59,12 +59,12 @@ static const char *qxl_draw_effect[] = {
     [ QXL_EFFECT_OPAQUE_BRUSH     ] = "opaque-brush",
 };
 
-static const char *qxl_surface_cmd[] = {
+static const char *const qxl_surface_cmd[] = {
    [ QXL_SURFACE_CMD_CREATE  ] = "create",
    [ QXL_SURFACE_CMD_DESTROY ] = "destroy",
 };
 
-static const char *spice_surface_fmt[] = {
+static const char *const spice_surface_fmt[] = {
    [ SPICE_SURFACE_FMT_INVALID  ] = "invalid",
    [ SPICE_SURFACE_FMT_1_A      ] = "alpha/1",
    [ SPICE_SURFACE_FMT_8_A      ] = "alpha/8",
@@ -74,14 +74,14 @@ static const char *spice_surface_fmt[] = {
    [ SPICE_SURFACE_FMT_32_ARGB  ] = "ARGB/32",
 };
 
-static const char *qxl_cursor_cmd[] = {
+static const char *const qxl_cursor_cmd[] = {
    [ QXL_CURSOR_SET   ] = "set",
    [ QXL_CURSOR_MOVE  ] = "move",
    [ QXL_CURSOR_HIDE  ] = "hide",
    [ QXL_CURSOR_TRAIL ] = "trail",
 };
 
-static const char *spice_cursor_type[] = {
+static const char *const spice_cursor_type[] = {
    [ SPICE_CURSOR_TYPE_ALPHA   ] = "alpha",
    [ SPICE_CURSOR_TYPE_MONO    ] = "mono",
    [ SPICE_CURSOR_TYPE_COLOR4  ] = "color4",
@@ -91,7 +91,7 @@ static const char *spice_cursor_type[] = {
    [ SPICE_CURSOR_TYPE_COLOR32 ] = "color32",
 };
 
-static const char *qxl_v2n(const char *n[], size_t l, int v)
+static const char *qxl_v2n(const char *const n[], size_t l, int v)
 {
     if (v >= l || !n[v]) {
         return "???";
-- 
2.1.4


