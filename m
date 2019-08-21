Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i0OpC-0001Sh-6p
	for mharc-qemu-trivial@gnu.org; Wed, 21 Aug 2019 07:30:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55642)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1i0Op6-0001Qy-Eb
 for qemu-trivial@nongnu.org; Wed, 21 Aug 2019 07:30:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1i0Op5-0004sx-6J
 for qemu-trivial@nongnu.org; Wed, 21 Aug 2019 07:30:40 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:52765)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1i0Of0-0006Ld-RK; Wed, 21 Aug 2019 07:20:15 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MQMdz-1heD4r3imP-00MIAd; Wed, 21 Aug 2019 13:20:01 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Michael Tokarev <mjt@tls.msk.ru>,
 "Michael S. Tsirkin" <mst@redhat.com>, Corey Minyard <minyard@acm.org>,
 Juan Quintela <quintela@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <rth@twiddle.net>, Jason Wang <jasowang@redhat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Carlo=20Marcelo=20Arenas=20Bel=C3=B3n?= <carenas@gmail.com>,
 Thomas Huth <thuth@redhat.com>
Date: Wed, 21 Aug 2019 13:19:37 +0200
Message-Id: <20190821111947.26580-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190821111947.26580-1-laurent@vivier.eu>
References: <20190821111947.26580-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:q2/G2f7YdljUDamyf4Gd15QAsQ47cXygEbzKIgGClihqqKBJGCY
 LC56J8jB+qoFP7l4rSOU509MdrudAHJ5NngpLanR3BoClWWcYs3SogqO/5MVOzxg3eixITL
 yD1CNJgFtAqy8KpK1iip23a5c0XF8RMIsEWd0OtTKVy7sTDpw/wwb8C5HpHvEB0piT58/Zq
 +0UBfuNiARhEMA8UxmyYg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ik8JSttQOEQ=:R8r/WfpGeJ0Db81at3tMx+
 cpu6X4XRc0CDrDpzGEl9ywVQB5RFPKQp8N9WRE6bytthL9+WRqrFiuy9Y0VVhacCjduLrmeoK
 aYAViYSj1APviaDV76L9eJDlWLe0yBJsEFO8wFdF1szUnw+HNH1wnuHfB5Ak1zVlEy/H9iodP
 4Lh0Vb0DqMFdPXNtYsJYep86uYIaxnBJPHA7kFp1+Cgp959fJlMN71L/lp1xCSKDC3M1HxicR
 CGcepaUIHs/rFq+Qc8pmOIjTwniV4xwTAjO7H84SKCux6mFRIeSZPvAdEa1fA/D+8iZHo/K/g
 WOqcLdPeda+mLeRrw280M6VgxE0DysQ15k6G2sIP1DIrMVZjPatxCRTexr7auWXnGSAIf2Zq9
 aqu9M8Q63DrIyPET6D/H69cPs0bps4iuhECkRke2EnBBjjxYY8HWTABvDI/rdq7Uk47ZN+Fc4
 N/TlbTDTx89bRem8FdAdS/xUe+6BaXhn2WDBRkp9QgOF4uMYOk6v7RmCsl/d/PQYkKQ483epX
 K6LM2CmCOab/wiSn1sIgkVRACcbvqlYqgDDzbkzL0svCfxjhSgfZkoTVJluejoUj1NDjCCu4N
 t3C/HyRMQqnv1cH6RG1MCHxLv7q0Q1Oh7rIx1SMpnpuKuH5ja+ZiqmaR7zW8nluMtL8ZGEBgo
 b0UYijrk6fIR8t5cd9ZV5eHgD6bx0S5vvdu4zf4RwAGnv1MYvYjZ39cOQIuo86E59xBKiHkcy
 P365qKF2+fpLbIfsutnHkSkVQVMuuucPwbbzF+Aa4XqO3cELfD45UMJt5RSVkr2sOURTln5Ln
 e3rMOdzkBr/veSoAFYVsTjcLyKr+A==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.24
Subject: [Qemu-trivial] [PULL 04/14] configure: fix sdl detection using
 sdl2-config
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Aug 2019 11:30:42 -0000

From: Carlo Marcelo Arenas Belón <carenas@gmail.com>

If SDL2 is requested but pkg-config doesn't have a module for it
configure should fallback to use sdl*-config, but wasn't able to
because and old variable (from SDL) was being used by mistake.

Correct the variable name and complete other related changes so
there are no more references to the old SDL.

Fixes: 0015ca5cbabe ("ui: remove support for SDL1.2 in favour of SDL2")
Signed-off-by: Carlo Marcelo Arenas Belón <carenas@gmail.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20190710225528.409-1-carenas@gmail.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 configure | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/configure b/configure
index 4e7b79c826a2..cc5ce7940582 100755
--- a/configure
+++ b/configure
@@ -3022,15 +3022,15 @@ fi
 ##########################################
 # SDL probe
 
-# Look for sdl configuration program (pkg-config or sdl-config).  Try
-# sdl-config even without cross prefix, and favour pkg-config over sdl-config.
+# Look for sdl configuration program (pkg-config or sdl2-config).  Try
+# sdl2-config even without cross prefix, and favour pkg-config over sdl2-config.
 
 sdl_probe ()
 {
   if $pkg_config sdl2 --exists; then
     sdlconfig="$pkg_config sdl2"
     sdlversion=$($sdlconfig --modversion 2>/dev/null)
-  elif has ${sdl_config}; then
+  elif has "$sdl2_config"; then
     sdlconfig="$sdl2_config"
     sdlversion=$($sdlconfig --version)
   else
@@ -3041,7 +3041,7 @@ sdl_probe ()
     # no need to do the rest
     return
   fi
-  if test -n "$cross_prefix" && test "$(basename "$sdlconfig")" = sdl-config; then
+  if test -n "$cross_prefix" && test "$(basename "$sdlconfig")" = sdl2-config; then
     echo warning: using "\"$sdlconfig\"" to detect cross-compiled sdl >&2
   fi
 
@@ -8023,7 +8023,6 @@ preserve_env PKG_CONFIG
 preserve_env PKG_CONFIG_LIBDIR
 preserve_env PKG_CONFIG_PATH
 preserve_env PYTHON
-preserve_env SDL_CONFIG
 preserve_env SDL2_CONFIG
 preserve_env SMBD
 preserve_env STRIP
-- 
2.21.0


