Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ipDni-0006FB-Qd
	for mharc-qemu-trivial@gnu.org; Wed, 08 Jan 2020 11:03:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36717)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1ipDnZ-00062R-Hi
 for qemu-trivial@nongnu.org; Wed, 08 Jan 2020 11:03:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1ipDnY-00026W-96
 for qemu-trivial@nongnu.org; Wed, 08 Jan 2020 11:03:09 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:39255)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1ipDnJ-0001sA-EB; Wed, 08 Jan 2020 11:02:53 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N8GhM-1jkA294BG4-014Cq3; Wed, 08 Jan 2020 17:02:38 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
 Pan Nengyuan <pannengyuan@huawei.com>,
 Euler Robot <euler.robot@huawei.com>, Markus Armbruster <armbru@redhat.com>
Subject: [PULL 2/5] util/module: fix a memory leak
Date: Wed,  8 Jan 2020 17:02:30 +0100
Message-Id: <20200108160233.991134-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200108160233.991134-1-laurent@vivier.eu>
References: <20200108160233.991134-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:hS/W2JMW7nZSLC0eATbtBj6PivLfM45GzikAafYooWqOMTH/Eae
 7iyfqSvy+QZsEMwCgFBCGdCN2lO3755qEwf2A5s5iXi/c55NekWtqO0o0nj+XgneyWcm9hR
 zOIYvWOmuyGgG52AKn+Zmz3+lbmUtietPv2AGLu2vrEzB4Aslp1mK0Fi4HTEmmgoboGYb6S
 RLjOe5BZ9BPh5XSKddV9A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:V2H1zfct0lA=:qw+R8WMdzOZiTSvJHc7vHG
 0SbNg+CnBwgIfzQ6uICPhUe1nt5EiS5WbesfBq40iXKc8RsxsfKdNnS3XazU6XXDoeXve6/gx
 VFaQWVkz8ZXDCCIUNaTgKmbMb8Ma2UPnNB6LxbwulJ4BJP+L/nhHw7/VAgha1PqxLs053MEUV
 RUE0YjMChw21AODNGbTDHmXrIdHKnS1o/Jp8RE/3vrexJ44V4LQCH+7RjHBNF89uIpVhRWnaP
 aG3tbu9LrfivyxRCimlQQ6BpGbI3ZXZKiNFwqelxWzPjeOmRQtBZwHPjOa4JKhAu4N1qtDUeM
 XozihjDBOMx7JNagAyVH5/lMwz7wJpKnLWkcK4oJvu96xGr0qcg08Ksq9PieDqZmK+0XHOvQb
 WWHlR8BqKMxuOCwz4RXh+IoUSfLyOTNIyFPi9/cEhmPGSPUltFQmwOD//uAF1wZ+FenhXa8p4
 xcZg/Pc3XgKabGyeYEF+2VjE0X++MXlgB3ZEkds3d0EVXMB3D5HkI16KWdcDsZWRGNwH59Oav
 C1xkKXwzafLAEEvP7BPKKA5QDt5Z2kFOjlPU2dOHyxfFlGqbvXu0zss0NF5scM1sKB+KFXUg3
 dX2HB9Gtx2DOxkotJV5j8gICaqMLtM0f/kj58Rl3CfSqm2gw8cZDTY+MYt/PklueajohPfVJa
 82UWDJYPF872CWXvVlC9F/RqK1L9gQLzGoq11TQNsiMSggwSYHVXZSqUgCqsLiRllc/0Ow/ne
 TEpK6sBtSI3LZ6i9MGy8EgXkXEpz8eiYySjWWe8MGegy3tnJGz1cPoqex/7oG21fbP/delnX1
 tyzMjoLJuhFVIkzWrviw9ckMoKF4mQPOzBvHMbmaH8RovYW4RiweZ9X6S2u1hy4AmUDvBXnse
 sx6i+5LUo6PLNg5iivWg==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.227.126.187
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
X-List-Received-Date: Wed, 08 Jan 2020 16:03:11 -0000

From: Pan Nengyuan <pannengyuan@huawei.com>

spotted by ASAN

Fixes: 81d8ccb1bea4fb9eaaf4c8e30bd4021180a9a39f
Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <1576805650-16380-1-git-send-email-pannengyuan@huawei.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 util/module.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/util/module.c b/util/module.c
index e9fe3e5422ad..8c5315a7a307 100644
--- a/util/module.c
+++ b/util/module.c
@@ -214,6 +214,7 @@ bool module_load_one(const char *prefix, const char *lib_name)
 
     if (!success) {
         g_hash_table_remove(loaded_modules, module_name);
+        g_free(module_name);
     }
 
     for (i = 0; i < n_dirs; i++) {
-- 
2.24.1


