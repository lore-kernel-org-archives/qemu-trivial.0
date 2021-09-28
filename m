Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mVDP0-00014w-Kk
	for mharc-qemu-trivial@gnu.org; Tue, 28 Sep 2021 09:44:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mVBxZ-0007x8-IS; Tue, 28 Sep 2021 08:11:45 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mVBxX-0000eZ-95; Tue, 28 Sep 2021 08:11:45 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4HJdY34twdzbmqZ;
 Tue, 28 Sep 2021 20:07:19 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Tue, 28 Sep 2021 20:11:36 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Tue, 28 Sep 2021 20:11:35 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Andrew Jones" <drjones@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 <wanghaibin.wang@huawei.com>, Yanan Wang <wangyanan55@huawei.com>
Subject: [PATCH v2 0/2] qemu-options: Trivial doc fixes related to -smp
Date: Tue, 28 Sep 2021 20:11:32 +0800
Message-ID: <20210928121134.21064-1-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=wangyanan55@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 28 Sep 2021 09:43:58 -0400
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
X-List-Received-Date: Tue, 28 Sep 2021 12:11:46 -0000

v1->v2:
- update the subject and commit message of patch 2/2.
- add R-bs from Damien and Philippe. Thanks.

There are two places found related to -smp that may need to be fixed
when reading qemu-options.hx. And after searching other Doc files,
there hasn't been any other similar issues.

Yanan Wang (2):
  qemu-options: Tweak [,maxcpus=cpus] to [,maxcpus=maxcpus]
  qemu-options: Add missing "sockets=2,maxcpus=2" to CLI "-smp 2"

 qemu-options.hx | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--
2.19.1


