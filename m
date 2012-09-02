Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T89w3-0001M0-Bf
	for mharc-qemu-trivial@gnu.org; Sun, 02 Sep 2012 09:09:55 -0400
Received: from eggs.gnu.org ([208.118.235.92]:38929)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <yann.morin.1998@free.fr>) id 1T89w1-0001LE-Nw
	for qemu-trivial@nongnu.org; Sun, 02 Sep 2012 09:09:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <yann.morin.1998@free.fr>) id 1T89w0-00024a-0p
	for qemu-trivial@nongnu.org; Sun, 02 Sep 2012 09:09:53 -0400
Received: from smtp03.smtpout.orange.fr ([80.12.242.125]:25492
	helo=smtp.smtpout.orange.fr) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <yann.morin.1998@free.fr>) id 1T89vz-000238-FL
	for qemu-trivial@nongnu.org; Sun, 02 Sep 2012 09:09:51 -0400
Received: from treguer.bzh.lan ([90.32.144.8]) by mwinf5d26 with ME
	id uD9o1j00M0B56Sa03D9oAu; Sun, 02 Sep 2012 15:09:49 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: qemu-devel@nongnu.org
Date: Sun,  2 Sep 2012 15:09:44 +0200
Message-Id: <1346591386-22698-1-git-send-email-yann.morin.1998@free.fr>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 80.12.242.125
Cc: qemu-trivial@nongnu.org, "Yann E. MORIN" <yann.morin.1998@free.fr>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [Qemu-trivial] [PATCH 0/2 v3] Fix static linking for cURL and SDL
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
X-List-Received-Date: Sun, 02 Sep 2012 13:09:54 -0000

Hello All!

Currently, configure checks for cURL and SDL with either pkg-config (the
default), or with {curl,sdl}-config (as a fallback).

But pkg-config and {curl,sdl}-config do not have the same set of options:
  - to check for shared libs, both use the option: --libs
  - to check for static libs:
    - pkg-config uses      : --static --libs
    - {curl,sdl}-config use: --static-libs

To add to the complexity, pkg-config is called through the querry_pkg_config
wrapper, that already passes --static when static linking is required, but
there is no such wrapper for {curl,sdl}-config, so we miss the occasion to
pass --static-libs.

To fix this:
  - introduce a new variable QEMU_XXX_CONFIG_LIBS_FLAGS that mirrors the
    behavior of QEMU_PKG_CONFIG_FLAGS; this variable can be used by all
    xxx-config scripts (eg. curl-config, but later sdl-config too).
    Default it to '--libs', which is for shared linking.
  - properly use either --libs for pkg-config (--static is already taken
    care of in the wrapper), or $QEMU_XXX_CONFIG_LIBS_FLAGS for
    {curl,sdl}-config.


Changes since v2:
  - remove trailing reference to cURL in the SDL patch (Stefan Hajnoczi)
  - sent to qemu-devel and cc qemu-trivial (Peter Maydell, Stefan)
  - fix type in the name of the new variable

Changes since v1:
  - drop the spice fix, it is not needed (bad env locally)
  - drop the added --static to calls to pkg-config, as it's already in the
    wrapper (Stefan Hajnoczi)

Regards,
Yann E. MORIN.

