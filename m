Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gHS9D-0002D4-Gc
	for mharc-qemu-trivial@gnu.org; Tue, 30 Oct 2018 07:25:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58580)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gHS97-000260-Cg
	for qemu-trivial@nongnu.org; Tue, 30 Oct 2018 07:25:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gHS91-0003Le-PN
	for qemu-trivial@nongnu.org; Tue, 30 Oct 2018 07:25:17 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:60689)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gHS8e-0002R3-De; Tue, 30 Oct 2018 07:24:48 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MCsgS-1gQDZW2FWq-008tOU; Tue, 30 Oct 2018 12:24:14 +0100
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MCsgS-1gQDZW2FWq-008tOU; Tue, 30 Oct 2018 12:24:14 +0100
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
	Michael Walle <michael@walle.cc>, Markus Armbruster <armbru@redhat.com>
Date: Tue, 30 Oct 2018 12:23:31 +0100
Message-Id: <20181030112337.17973-15-laurent@vivier.eu>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181030112337.17973-1-laurent@vivier.eu>
References: <20181030112337.17973-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:g5ba0aGiQIhKNZQKzBcM73r/UbedX9z9Q+bwBO3E5dSMCN4T4ND
	Xj4biXxswOFgZ0M2GQW/WZwxl8HPlr6S/wqvU7CUDa4NeUJu16QR2WRS3hqa7Z4cuWr3sQw
	FLbu5kybqWRnoCmrq2o0VjvSiJ9Z60rfpjAtSUYsHN7TlRSjGFGAbhcxeSnLPxFB7gWu/Nz
	E7vb6avBOhIvrF2HRzuOg==
X-UI-Out-Filterresults: notjunk:1;V01:K0:dSiTzJmTzx0=:bY02KXQE/BFOriVgAZE9k0
	vBF1sd4moRPgEuKkwXeU1B2tsSb/Gq7YoM3wf6FL9mABQDT8uv9gs2iD9VUMfKywyfJ1SxgQh
	AS4pwdOKnrJMUizp8aijtoRQHAcjM9CLaMJl/fcdZhlYSvZAUrNNuuoVfsrdhfZPptZKy1oqj
	shdZu2qLIETz2qBHDQHS6+u4CZC7NZ22jcx3I9eaHjTVRyIesRlok0yG+DkW6sSQcwqzFgwL6
	0cYKVvHv3M+GfvF832OnEF6EJtApVBKoZCjBIFnjyayXoSK+1CME/UFvUtEYtd5wWoACtHo9A
	6uVtpG2WLed1ol3z/PkKmgjSfFKZDugW6pFaMZxm8JSSxjflU/NyPzBXTI3gvjM4g7YWKsvkQ
	LSOOvI0HegcNnsuDHnfJTnFksOgqyubFygKZurLhEX59iulVoQLEOHDDofG0Vov/he5bz/+BO
	OJW+fLy4vZE10SOb5WlpPOizbAdAyG4Zu+zOSsFaOcd7efvpYp2TKb8rshzsT4pFtk4yp96jA
	+zWvYP+5Aj8DriABJEMxxFm158+XLv3ynqrEeJjyDAXD0ngKv2zODwd8yo5jF7SMH1k/l2fdE
	jy6lI3krKnfoPya5Hoi2DO6H83Gqf7gaNJoBVShKAmVYUZN7tZpj9lq4rODXKczZ4luAY3vDb
	xgkTGutX/u/W9BisJq/oHpHgFxZgnqVkrAzGqbzsYMggGmHUNqGIPZl40cv7BYpP7SdaHAIqR
	llNI4dJu1DsWD91L
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.130
Subject: [Qemu-trivial] [PULL v2 14/20] qobject: Catch another straggler for
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
X-List-Received-Date: Tue, 30 Oct 2018 11:25:21 -0000

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


