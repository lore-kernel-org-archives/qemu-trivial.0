Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gG4Jo-0005Ql-LS
	for mharc-qemu-trivial@gnu.org; Fri, 26 Oct 2018 11:46:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49998)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gG4Jj-00041t-44
	for qemu-trivial@nongnu.org; Fri, 26 Oct 2018 11:46:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gG46b-00056Z-Sy
	for qemu-trivial@nongnu.org; Fri, 26 Oct 2018 11:33:00 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:38645)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gG46b-0004pe-5K; Fri, 26 Oct 2018 11:32:57 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MqINP-1fkWcM0r3b-00nPqS; Fri, 26 Oct 2018 17:32:09 +0200
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MqINP-1fkWcM0r3b-00nPqS; Fri, 26 Oct 2018 17:32:09 +0200
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
	Eduardo Habkost <ehabkost@redhat.com>
Date: Fri, 26 Oct 2018 17:31:19 +0200
Message-Id: <20181026153125.24738-15-laurent@vivier.eu>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181026153125.24738-1-laurent@vivier.eu>
References: <20181026153125.24738-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:BYR+/FPhEvEIEPaEM5ke2EXSPWYCalHZ0Y81g7n3v3Tl3p//XTQ
	o6GosBJsTIKYw/euWRnKMWZD4sKg4mcJEFHpocdLHNonF/yZncm5xqg8lu93h6CYOkdBT/n
	D38fB3r0/AEutCRHTyOewRUmSkMX/pm+hxr3Ro9oCVuHeDRl9LWBcYc8HoHHTw+g0uS7n3F
	NBROm3ztSMeuMNBqmkFEg==
X-UI-Out-Filterresults: notjunk:1;V01:K0:Fvg2WalvKo4=:nBzqshRJOV20mzxB+QvkFN
	awi2dQnkDtBvX4YV3SSHdiONNwwKlL5XWpYI1YXMBQY7Mq5f3nfuGlNeXjGMUf3m+FEmrVaZJ
	11R7omVgLeRdzviaLZ5ZcqZRvc0nXXrEKTT0buFO62pMeCBpdMsyMw0w/gmKNALVQfD23w+Sp
	VHokr35LpzGOGVUQkh8ADFrQjacCzYnV8ILB4nuRevzd0nK2b54P1Z5Xuxo1UpMtFO8PvvJNF
	7qWw+oZ7MJlAXPpPUiQw8xqTu6NFDkF4oDbrqRqj2Ws8fkIBejOHIy/yUvURUIs+kXUMlwetl
	Du5AGvcQZqi036ahTuAGgtgN/eB8JdqY8bU+Tf0Wp5M0Uvz8kNbUWDfYetRK61UJXl5CZ7KQY
	dKnzy4QFZHxGKpHdzriIE/PPTFBKFp+mXMUzSuEoCIbT3frYSr6UdcviHwJcZphZXWsnHmSRr
	21Cg0SfHVlGn2DX/VvvMrPU8LyDespxfpEEmqxlqJgcnG1eRHxvUt0q/pFTuIWOMEEC9jkdKX
	b+d/gP9KS/yjb5qcRriqYA8oFvZKEsxM4zCuMWGHOgNaTq6KQnOQMZzy1vLVmwIW4dzh72B6d
	jeQsbdXwqPMWViEkobCI1qabdyGwFMWmlWYWOsCbGQCmHXXDLoV/vfDlHXpB48X2K2EJIQPM/
	OTY6fGK1P6BND3wLNryRETdhX2+2ixv0ux9lF/juSfNI66/PCgvjJELL26CFnpcVsM8USxNLb
	gzvHG8A8Zcy25FiO
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.131
Subject: [Qemu-trivial] [PULL 14/20] qobject: Catch another straggler for
 use of qdict_put_str()
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
X-List-Received-Date: Fri, 26 Oct 2018 15:46:34 -0000

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Patch created mechanically by rerunning:

  $  spatch --sp-file scripts/coccinelle/qobject.cocci \
            --macro-file scripts/cocci-macro-file.h \
            --dir . --in-place

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20180705155811.20366-2-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 qobject/block-qdict.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qobject/block-qdict.c b/qobject/block-qdict.c
index 42054cc274..1487cc5dd8 100644
--- a/qobject/block-qdict.c
+++ b/qobject/block-qdict.c
@@ -577,7 +577,7 @@ static QObject *qdict_crumple_for_keyval_qiv(QDict *src, Error **errp)
         if (!tmp) {
             tmp = qdict_clone_shallow(src);
         }
-        qdict_put(tmp, ent->key, qstring_from_str(s));
+        qdict_put_str(tmp, ent->key, s);
         g_free(buf);
     }
 
-- 
2.17.2


