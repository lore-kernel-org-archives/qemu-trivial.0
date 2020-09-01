Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kD6zU-0005uu-TK
	for mharc-qemu-trivial@gnu.org; Tue, 01 Sep 2020 10:10:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1kD6zI-0005Lm-QO; Tue, 01 Sep 2020 10:10:16 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:53173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1kD6zD-0003lF-Tx; Tue, 01 Sep 2020 10:10:16 -0400
Received: from localhost.localdomain ([82.252.135.186]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1M9Wqa-1kGOEd1kgu-005XLt; Tue, 01 Sep 2020 16:10:07 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 15/44] hw/core/sysbus: Fix a typo
Date: Tue,  1 Sep 2020 16:09:25 +0200
Message-Id: <20200901140954.889743-16-laurent@vivier.eu>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200901140954.889743-1-laurent@vivier.eu>
References: <20200901140954.889743-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:uhyHOkyzsjzby5kCiitKF4XT9zu/Cc96r8PYtPu9NQ2Vh4xWozs
 s9lRP4Pc7s3Z97xI47D/Np/4qFafcZesz+Bu6W8+VPWUuQ8ocQjN8DtdvW6NjMFSm30pyHl
 Lg/luf94xS3Bltht6sd4Qp+0B4w/D/eblVmyGmSNoYALXvSHN4mA6DCPK5wC8nvOZYP+0OI
 sItrwJputbOMNTej5yiPA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:mPBbFZdFeMg=:dB8Rw/qhuw9Gqo+IfKeGHj
 dWr/lccKEjHfeJd3aiyJT0hSBNBcNh2Y2G9SAsN5yeSWYewfuf1EzEKqe3+ELl9hDnS8NxWq5
 DY7evRozaVwIc+ZlWVf29IWJfdLYKf4s8LmaZKd+LBvkvvswidXEsQC4nc0wCurYF0N+lUpmz
 QqtLhB7WQIu20GtoE9nbLnKPnJHqXEkB/vM9qUmwHv/MRsi7p0bhCfwMnba07OYa5EFJehUr1
 MPTuYCNbDWemRmklnV/QNXekdur/d0kq1hQuS94B46OeZXxC/9ezwqzltSQRywugw/3d/w73L
 Dt6K21bHeaX/lQ4VGdrpmQfHyR5pnXEie2SVIzvFsn3eCbTPNumDwzv9OX4UWMyYf4gRR7c8T
 VxqDQDuNa80em39gWKkjBCTDGCCxEipBo1duL5hWnqQJDb3y6Fumun9nCZFyozZw6fhA8pe8o
 XFmG9f39sF1CCic0hosSiTIQQlIv883VlaM+CN/nrv+PxnTYmZ3ZVcQ3lHAqDlDDwWSHI0v6q
 R9DHEwMudIzUmscEZPkdI+IgKxg+56I55Opnofe7j1onGwohIzxRn2TNw0n30Ef6QLJkV/CWp
 jleKgMIyDoBV3sch7Y6KRw7QFoFpK1eFYHSof46n7AZPMmbLrkX0+XRMO4V/8EE9YcMmzDjAT
 PHFuDzeoQ8lQneHHr7lS9uJElY8N7RdY5WP4+ictWkTLx2lvIesEmiLM/BdW7HiMTlTtavTpD
 M0Je4sd7BVpmkH52OwJbpOGVnZPu8OztwSI1+DoWAq6Wo7aYPTE5cfGg3TiQr4SC2sjvI3HcU
 DvILhXnR5ZPNv03FsN/KGR0tossJUKynVFsw8cNcvHbNsL2QQi8UEhmQm77kyDu5veE+942
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/01 10:09:57
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Tue, 01 Sep 2020 14:10:17 -0000

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20200806130945.21629-2-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/core/sysbus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/core/sysbus.c b/hw/core/sysbus.c
index 70239b7e7d09..77ab351ce1a8 100644
--- a/hw/core/sysbus.c
+++ b/hw/core/sysbus.c
@@ -64,7 +64,7 @@ void foreach_dynamic_sysbus_device(FindSysbusDeviceFunc *func, void *opaque)
         .opaque = opaque,
     };
 
-    /* Loop through all sysbus devices that were spawened outside the machine */
+    /* Loop through all sysbus devices that were spawned outside the machine */
     container = container_get(qdev_get_machine(), "/peripheral");
     find_sysbus_device(container, &find);
     container = container_get(qdev_get_machine(), "/peripheral-anon");
-- 
2.26.2


