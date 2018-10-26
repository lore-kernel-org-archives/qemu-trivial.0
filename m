Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gG4Jb-00059C-Eu
	for mharc-qemu-trivial@gnu.org; Fri, 26 Oct 2018 11:46:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49903)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gG4JR-0003tU-3H
	for qemu-trivial@nongnu.org; Fri, 26 Oct 2018 11:46:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gG46k-0005HT-VV
	for qemu-trivial@nongnu.org; Fri, 26 Oct 2018 11:33:11 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:50307)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gG46c-0004pG-BA; Fri, 26 Oct 2018 11:32:58 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MHmuE-1gKxte44cI-00EtqH; Fri, 26 Oct 2018 17:32:01 +0200
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MHmuE-1gKxte44cI-00EtqH; Fri, 26 Oct 2018 17:32:01 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
	Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
	Michael Walle <michael@walle.cc>, Laurent Vivier <lvivier@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Cleber Rosa <crosa@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>, xen-devel@lists.xenproject.org,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
	Fam Zheng <famz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Aurelien Jarno <aurelien@aurel32.net>, Kevin Wolf <kwolf@redhat.com>,
	qemu-block@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
	qemu-trivial@nongnu.org, Riku Voipio <riku.voipio@iki.fi>,
	Eduardo Habkost <ehabkost@redhat.com>, "Emilio G. Cota" <cota@braap.org>
Date: Fri, 26 Oct 2018 17:31:15 +0200
Message-Id: <20181026153125.24738-11-laurent@vivier.eu>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181026153125.24738-1-laurent@vivier.eu>
References: <20181026153125.24738-1-laurent@vivier.eu>
X-Provags-ID: V03:K1:GLB0mYYnfApJP68SEo13hvBeJvGYhMbIqgqKLx71zpXu9iLI3OS
	pyPgDiUiZq/11QMNSoWCIWlXTj5eVXeHsEC0rWE5tNKXTVtVXrizW6jfthcDgGZgRbUvISQ
	xZFoh+dyVn+Qiuam6N6Mjbun89sOPq5h8UYSkyYKhwt7BX7sDV8mSz4mbjhWezrDAmaDyqZ
	1R+3xrk16csIlR2SjC5pg==
X-UI-Out-Filterresults: notjunk:1;V01:K0:vVwgMDbK/qo=:nLfGV5TAWnSor2ljWWEgnA
	gvrSqjujEC1XqVSWcERipkSOiJhtzxmLdVI4KPlFlPGEPg2L4y0jEobuoYPG7qtuvjhGo36Tv
	YyfkcgzcoXP7/8CgiCFnow4XZUtAVxFatqjqU+9+f/3B5FpyyTx04NXuNVp4L9c0m5YDcRW4s
	4Tg1W6sLyNRfa/97ZT2yS1TJlsEgOtmWQ2qM/8nYbjg/avjfgT0An2qiwv4OR1SALq3r+KjW7
	m+6YV9Hc26aDTNIiXuPp3lzQKXkw3/Z4KS+wqgj+kRcsClV03dfFzutV9FmqxvuTpCHgDmXpn
	XX4XcMnIyf7d/yg8s/9b2w8aalSYK5slskm313zazZhNUYdhCnJWGjHkLwQ6W3ECoafC9k2BD
	n4mh9xlwA0US7lU4EzlEAOgv4jaZEiO9OiksSGR+m3uaTOssKHDf5z3KuDfz2pF9VeY6M4gMa
	b+0eex/xdcFlSlIrawy7kkqkmV4+TxRYB3SaPoYzXXtQkYLLNJOnwrPUuiqaopsuRZhYgk3r1
	58HHc72V1uHvXeSmGG+mHYswq0ZiM3T8iO66sY9rIlwNh5W45v9W8fGdJKOzaiKACWicT78Yx
	Jnm/Z3EPmR5AD3LUWnFQ1WZ8MYd81f7L54S65MDvR/IZyL6lRR2gWvLOLeZl3LdBbkCKDWlwH
	ZRwt5omGI8zW3WPt87J7baxdjMiSuQR4TxXaxY8/j6uMazOoNXAYwRJOeu6HteTczpcU=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.130
Subject: [Qemu-trivial] [PULL 10/20] linux-user: fix comment
 s/atomic_write/atomic_set/
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
X-List-Received-Date: Fri, 26 Oct 2018 15:46:20 -0000

From: "Emilio G. Cota" <cota@braap.org>

Signed-off-by: Emilio G. Cota <cota@braap.org>
Message-Id: <20180811211011.6277-1-cota@braap.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/qemu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 1beb6a2cfc..dde3f26f5a 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -143,7 +143,7 @@ typedef struct TaskState {
     /* Nonzero if process_pending_signals() needs to do something (either
      * handle a pending signal or unblock signals).
      * This flag is written from a signal handler so should be accessed via
-     * the atomic_read() and atomic_write() functions. (It is not accessed
+     * the atomic_read() and atomic_set() functions. (It is not accessed
      * from multiple threads.)
      */
     int signal_pending;
-- 
2.17.2


