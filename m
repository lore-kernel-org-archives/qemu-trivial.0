Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T68JU-0001Kl-PY
	for mharc-qemu-trivial@gnu.org; Mon, 27 Aug 2012 19:01:44 -0400
Received: from eggs.gnu.org ([208.118.235.92]:35482)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <yann.morin.1998@free.fr>) id 1T68JT-0001KX-5e
	for qemu-trivial@nongnu.org; Mon, 27 Aug 2012 19:01:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <yann.morin.1998@free.fr>) id 1T68JS-0003F2-AT
	for qemu-trivial@nongnu.org; Mon, 27 Aug 2012 19:01:43 -0400
Received: from smtp08.smtpout.orange.fr ([80.12.242.130]:16962
	helo=smtp.smtpout.orange.fr) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <yann.morin.1998@free.fr>) id 1T68JS-0003Em-4L
	for qemu-trivial@nongnu.org; Mon, 27 Aug 2012 19:01:42 -0400
Received: from treguer.bzh.lan ([90.32.252.246]) by mwinf5d15 with ME
	id rz1f1j0075Kjsuq03z1ftA; Tue, 28 Aug 2012 01:01:40 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: qemu-trivial@nongnu.org
Date: Tue, 28 Aug 2012 01:01:32 +0200
Message-Id: <1346108494-31787-1-git-send-email-yann.morin.1998@free.fr>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 80.12.242.130
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: [Qemu-trivial] [PATCH 0/2 v2] Fix static linking for cURL and SDL
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
X-List-Received-Date: Mon, 27 Aug 2012 23:01:44 -0000

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
    Default it to '--libs', which is for shared linking;
  - properly use either --libs for pkg-config (--static is already taken
    care of in the wrapper), or $QEMU_XXX_CONFIG_LIBS_FLAGS for 
    {curl,sdl}-config.


Changes since v1:
  - drop the spice fix, it is not needed (bad env locally)
  - drop the added --static to calls to pkg-config, as it's already in the
    wrapper (Stefan Hajnoczi)

Regards,
Yann E. MORIN.

