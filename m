Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mXJNR-00015z-TC
	for mharc-qemu-trivial@gnu.org; Mon, 04 Oct 2021 04:31:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mXJNP-0000y3-Oj; Mon, 04 Oct 2021 04:31:11 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:57977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mXJNN-0003Sz-VX; Mon, 04 Oct 2021 04:31:11 -0400
Received: from quad ([82.142.3.114]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1N8n8I-1mtk1N2rLS-015pRt; Mon, 04
 Oct 2021 10:30:59 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Yanan Wang <wangyanan55@huawei.com>,
 Philippe Mathieu-Daude <philmd@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Andrew Jones <drjones@redhat.com>, Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 3/5] qemu-options: Add missing "sockets=2,
 maxcpus=2" to CLI "-smp 2"
Date: Mon,  4 Oct 2021 10:30:53 +0200
Message-Id: <20211004083055.3288583-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211004083055.3288583-1-laurent@vivier.eu>
References: <20211004083055.3288583-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:+znkSTmwQK7jrUENj3wTiCxx+HnY6rkxtDVH2yuFsyrGiTlxdTL
 JogxXdvf2SUwG2q6H9oNMi7KlBfj9eRvsOnuLvXxTxuOYMlELcPpuBaBttsEjFTf1mmLGoI
 bmw7ke5swDN6mSNvAQQLECzgAbfzhQUqZWehhw3ZGOmjWVUJdRHRpj3F68u2OCpW/VRmK68
 4My20gLsAB1NOCc9IxW3Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:XVfK7VzuVrY=:B0FDukSSKCIDQCJHw6m/IO
 3QODWu9UOFKVkteg0MxFWTG7yTngU+krxYIR6Oi7ypLqhTLq4mM8zNZOoxPT7ulyjPeiANBNV
 n3rBwXMkCwxKmIPZybST6zR4Fp9K87mMvk3ML5NY43TuWXZXyQT5YrluRi0ZOkO9DUH7h8s/y
 EkUDNuvAk+sBZvYlQ6NtsbHzhLbNMklQwKT5I/JFfPtVpgB9nxcb9PUKKgA5zlVcPQ0VePgsZ
 h6ndHF+JssgGs5cUfjm9//bXe8y3UnMWJmc/Ggpn9CYzII+PbOJEDLrvzqszN0o6eHZ1Z+D52
 im9gy3j3QUA9i/n9mVHA0YZaNkv3/oJtJSpZ+0j3XznokmpJ62vIiJJ2mdY3bNCURXBYFXwiL
 fvhS7S62DyeEbqIbIXV2Fj4CqZcijq8eznJd29zqkmpEmX4AIgWydCA3vKgpYlYcJoUWMgxdo
 fJI0t701ciuKR+yPPou4WkzBXT7qpq1OHLtUB2qTYijwL0cnR7ag4PWotOjKDqEwuwBM/9NnY
 k+Df5IwxP9QaNC6ynzU0nKfv5xibyL41fgeFmoom5w3oQky0DVlqJSabCLUmj/UUWdWWJr5Aw
 nBHIKgKfGMBsiLSfwKHozscBEwk/rleSW1rijezybwoRTkQ7TkoLE80YWhlhfBG9uuyVIeLHH
 8xls08xXuSnRMVzu25We0hQ+HYnMR01Rc0ZqMcN9DHt6noz8fFlconHZ6cXz08CY7Z5yZb3oE
 od3+/lD+k90F3KiLpYJozuj3kyYXJP7F4H+cdg==
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
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
X-List-Received-Date: Mon, 04 Oct 2021 08:31:12 -0000

From: Yanan Wang <wangyanan55@huawei.com>

There is one numa config example in qemu-options.hx currently
using "-smp 2" and assuming that there will be 2 sockets and
2 cpus totally. However now the actual calculation logic of
missing sockets and cores is not immutable and is considered
liable to change. Although we will get maxcpus=2 finally based
on current parser, it's always stable to specify it explicitly.

So "-smp 2,sockets=2,maxcpus=2" will be optimal when we expect
multiple sockets and 2 cpus totally.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Reviewed-by: Philippe Mathieu-Daude <philmd@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Message-Id: <20210928121134.21064-3-wangyanan55@huawei.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 qemu-options.hx | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index bba1ef973fec..5f375bbfa666 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -401,7 +401,7 @@ SRST
         -m 2G \
         -object memory-backend-ram,size=1G,id=m0 \
         -object memory-backend-ram,size=1G,id=m1 \
-        -smp 2 \
+        -smp 2,sockets=2,maxcpus=2 \
         -numa node,nodeid=0,memdev=m0 \
         -numa node,nodeid=1,memdev=m1,initiator=0 \
         -numa cpu,node-id=0,socket-id=0 \
-- 
2.31.1


