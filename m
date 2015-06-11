Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z33sO-0003wi-4z
	for mharc-qemu-trivial@gnu.org; Thu, 11 Jun 2015 10:54:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58486)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <fziglio@redhat.com>) id 1Z32N8-000122-M2
	for qemu-trivial@nongnu.org; Thu, 11 Jun 2015 09:18:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <fziglio@redhat.com>) id 1Z32N2-0005Zq-Va
	for qemu-trivial@nongnu.org; Thu, 11 Jun 2015 09:18:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40420)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <fziglio@redhat.com>)
	id 1Z32Mw-0005Y4-UF; Thu, 11 Jun 2015 09:18:07 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 656EABBB58;
	Thu, 11 Jun 2015 13:18:06 +0000 (UTC)
Received: from rhwork.redhat.com (vpn1-7-156.ams2.redhat.com [10.36.7.156])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t5BDI3aE008890; Thu, 11 Jun 2015 09:18:04 -0400
From: Frediano Ziglio <fziglio@redhat.com>
To: fziglio@redhat.com, Gerd Hoffmann <kraxel@redhat.com>
Date: Thu, 11 Jun 2015 14:17:56 +0100
Message-Id: <1434028677-26160-1-git-send-email-fziglio@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
X-Mailman-Approved-At: Thu, 11 Jun 2015 10:54:39 -0400
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH 1/2] Constify some variable
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
X-List-Received-Date: Thu, 11 Jun 2015 13:18:21 -0000

Signed-off-by: Frediano Ziglio <fziglio@redhat.com>
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
2.1.0


