Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gHS8n-0001gX-Am
	for mharc-qemu-trivial@gnu.org; Tue, 30 Oct 2018 07:24:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58057)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gHS8i-0001dD-Gs
	for qemu-trivial@nongnu.org; Tue, 30 Oct 2018 07:24:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gHS8f-0002cf-29
	for qemu-trivial@nongnu.org; Tue, 30 Oct 2018 07:24:52 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:47143)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gHS8e-0002SL-IW; Tue, 30 Oct 2018 07:24:48 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MmlCY-1fsnlA1Eta-00js2W; Tue, 30 Oct 2018 12:24:06 +0100
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MmlCY-1fsnlA1Eta-00js2W; Tue, 30 Oct 2018 12:24:06 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Cleber Rosa <crosa@redhat.com>,
	Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>, Anthony Perard <anthony.perard@citrix.com>,
	Aurelien Jarno <aurelien@aurel32.net>, Max Reitz <mreitz@redhat.com>,
	Fam Zheng <famz@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
	Kevin Wolf <kwolf@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Stefano Stabellini <sstabellini@kernel.org>, qemu-trivial@nongnu.org,
	qemu-block@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
	xen-devel@lists.xenproject.org, Gerd Hoffmann <kraxel@redhat.com>,
	Riku Voipio <riku.voipio@iki.fi>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <lvivier@redhat.com>,
	Michael Walle <michael@walle.cc>, Markus Armbruster <armbru@redhat.com>,
	"Emilio G. Cota" <cota@braap.org>
Date: Tue, 30 Oct 2018 12:23:27 +0100
Message-Id: <20181030112337.17973-11-laurent@vivier.eu>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181030112337.17973-1-laurent@vivier.eu>
References: <20181030112337.17973-1-laurent@vivier.eu>
X-Provags-ID: V03:K1:iduT3obFj7K1iAg6oBhUb4ixk+5svClYbEK4LAQjtywllXs7/pM
	KXdwAq9BbVsAnnocLClN5VeDPuS5pSgniB0jCgpETNrOyncCHDVNVNHf/HwfQeRwSQV52Sd
	bnDFZq3BMN2jn/YUk214peMgOqk83B7IPxVZiM6mNua6l8epS3P7+F3tt0+8oXBZfExdljW
	JpP14TVIduHIXRp5BFgHQ==
X-UI-Out-Filterresults: notjunk:1;V01:K0:ZEHEYkSyeuk=:+dN7qyj6pb9jR30KZVhYzu
	FOtMRzx5/1qaHSnyB1NSWcMpuSZ/GbpA4bIK5UmyVfC2mB2jRq4VccFEnTqcVkFe5Zj/cCvKA
	9QyuzRchLb1zn8jfW2ydLrxDIzo/BOarg/yxv/xo4zPdOxJ3kZChuLXKOakzZLoKYU7t/CcuO
	rIfwVwiwxJECIVRe+mOvWVlNobvufNW4LgRj6FOkdBBVshhjR9DOKoqQl10SlVWQMAv3iO7IB
	bLMjPJquuoL9Dd6UL2RTGysrvTmfnZVuJsRsyvBeQG77UagJc4OnaiGLSLkBlEYZVJjh4nH0G
	VYAJdKPtGMb86o18DKxc3dNBIms7MInQghS7NMQ5TLw1RvgZ8n/qO4lOhbmN11kEVf1JCg5ke
	bFv5yLJXwiXCmT8EdyKejSdSWDmTGFN3cpmFw37EXw8AAe80KgRCWQATRcYTTqmeq88jWKuEd
	zxBHI++7gQL0+d8zqZh3XXd5mf/KApY2W2/JlFviGRKsMOYCL8T09qbDmEg/e2uhTZ8jQI3dR
	ML8tjymLTQJhygcxFcVjXPIMQ3lIRkZEyba7bQScKoUSO1Sw1lU3pPD3u3MyfhxEUCqZyECeE
	8D9lpJ7kU7hsXNvnacajRIPBrOT7TD0Ve2XvuH7WhbCUeYmobBjn3v4W8AlIXXTWVq1Eqi3YK
	VhO3pa8uOhf4ududqK2QQFNHBtGmCj/G/DcYCc2IIopmtM/TygbiSyzDF1lwangG0OZI=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.131
Subject: [Qemu-trivial] [PULL v2 10/20] linux-user: fix comment
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
X-List-Received-Date: Tue, 30 Oct 2018 11:24:55 -0000

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


