Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1goEDS-00035r-En
	for mharc-qemu-trivial@gnu.org; Mon, 28 Jan 2019 16:13:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58596)
	by lists.gnu.org with esmtp (Exim 4.71) (envelope-from <n54@gmx.com>)
	id 1goEDP-0002oV-A7
	for qemu-trivial@nongnu.org; Mon, 28 Jan 2019 16:13:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <n54@gmx.com>) id 1goE39-0005Ug-QS
	for qemu-trivial@nongnu.org; Mon, 28 Jan 2019 16:02:38 -0500
Received: from mout.gmx.net ([212.227.17.21]:57321)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <n54@gmx.com>) id 1goE35-0005PD-EE
	for qemu-trivial@nongnu.org; Mon, 28 Jan 2019 16:02:32 -0500
Received: from localhost.localdomain ([89.71.135.231]) by mail.gmx.com
	(mrgmx102 [212.227.17.174]) with ESMTPSA (Nemesis) id
	0MLR30-1gng521kt0-000YWR; Mon, 28 Jan 2019 22:02:18 +0100
From: Kamil Rytarowski <n54@gmx.com>
To: qemu-trivial@nongnu.org
Cc: alexandro@phi.nz,
	Kamil Rytarowski <n54@gmx.com>
Date: Mon, 28 Jan 2019 22:01:08 +0100
Message-Id: <20190128210108.21318-1-n54@gmx.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:HzJ42l6kgmevxCBA4uceo88h2f/G0BnUyqqHovUiFKk77qAMTht
	xJkSKR5XyLicLg7N/GvfVqh2X51+8PreU1eui10OAHQgngLRthsDeGx7VNtzGQ66OZZTpVg
	emEaALKlhte2iGhVilLoOuqolctWWrce8Y8KZo44kktWJ/e4RItzy7w0L6LhsLiHxXS31ME
	GgLsZUlHts05OYpAVHX0A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:WiUWOCTYeK0=:b9dJ19iXLXGIgqKo+lGwjH
	pu46xfHPZ4yj9rYy1jpzj9dP4aIcdoWPvR5GkPHzoC/XQnuJUfl8at15nKBu+MCSz7ch4we5Z
	1MxvCTbMz/yPimJJHkgvJx1L0pNX3PY0s4xEdywNpU+hMPB0kuW1oSwBbedzzYQ1P48y5278U
	BYKAzJDmbnHxoldTATGWk5p92PNzO2NSCpSzqea5YBNaV94DhggraBWEFO4LQhKNZ1aSGEp5a
	yCfV5OVvU7j89/QPVQZxaEg0hu38fo7WRtnf8g2cfq2MwvQSO9eVCI83ogsWm2raw+fEJqqx7
	tWcUiXanRuhCN6oPaNWUy1oS0JUbMR8ulJ5MU9IL9UlQRiolN7cSbn5sfjbcJwBoOSLErnW/F
	lW2UQMM/Z+GI7IIF9agvzexoYXny75m/D2y6Nk10aa14JboyTbE0QksDqYBYzcAzoC/30zH4Z
	2bibKCdPh+fYKJ5C3CNt7feKJqWr7KT8/bNaRLCliDVL9KyqWyC/lx4ocQ6oCiMaVSICjGNI2
	n76ZYtSJfIg24+lRt09tq+/I9PCW4eH9hoOcHKtMTaVgPXB4F9y5//a36PpvlSLMKhiKuR38F
	LGAj7TleJ/k6OKmZVdEam4Z2W+ulTZQi+CwsDfsc3andbxLehEUyR4mWJQwkJTxPh4DJa5+XI
	zILE54W4xbzmzaI+c5aXkOiHzKvYeb8tAdLKs4sP0Z3/v1esq5hxwzC4KGupbho82Ul1U419D
	IqCQkyQ7Yu4mx6+rdW1f5QwXyHmgzJoMJex5QNh4hcShIwKKDfvV4M7CoBO9xaHpfkyOpg9XR
	MUXtEi6joU72di4ARS8Ekw9ynmYb9TAqFYFGizGMqNL6C6pV3oHe5Df80i5oH1yzGxT6qXmQ2
	bZpCQn+MT42aHfWwaudp4qrXLfNDzsmFlqUYH07OM=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.21
Subject: [Qemu-trivial] [PATCH] configure: Add HAX support in NetBSD
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Jan 2019 21:13:12 -0000

The NetBSD support in Intel HAXM has beem merged upstream and is functional.

Signed-off-by: Kamil Rytarowski <n54@gmx.com>
---
 configure | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configure b/configure
index b18281c61f..89b889072d 100755
--- a/configure
+++ b/configure
@@ -819,6 +819,7 @@ DragonFly)
 ;;
 NetBSD)
   bsd="yes"
+  hax="yes"
   make="${MAKE-gmake}"
   audio_drv_list="oss try-sdl"
   audio_possible_drivers="oss sdl"
-- 
2.20.1


