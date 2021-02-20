Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lDRUL-0007FN-3Z
	for mharc-qemu-trivial@gnu.org; Sat, 20 Feb 2021 07:35:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lDRUH-000761-L3; Sat, 20 Feb 2021 07:35:53 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:50935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lDRUD-0003MT-8P; Sat, 20 Feb 2021 07:35:53 -0500
Received: from localhost.localdomain ([82.252.134.158]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MKszj-1lY9IK0OKL-00LDlm; Sat, 20 Feb 2021 13:35:37 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Gan Qixin <ganqixin@huawei.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>, Thomas Huth <thuth@redhat.com>
Subject: [PULL 07/12] nvdimm: put it into the 'storage' category
Date: Sat, 20 Feb 2021 13:35:20 +0100
Message-Id: <20210220123525.1353731-8-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210220123525.1353731-1-laurent@vivier.eu>
References: <20210220123525.1353731-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:WqdCScj5/hMZfWRJJscnfbcoHTtWeP/35q5p1Sr+B3O9zc4Ah64
 N4v1hSQfXzbGmko8t5kEqqutCKL5rvZB81G+DrwWt0yxYfxt23j44+l2Efg+v3t4VSeX/+/
 6w0wtqueOW8NdFToimg6Xhf/y9EHyw7x0uK2q/5jzcPRnwNcWI74DfeCGlFkznmGZiycNqY
 a7VhoZ2n5MSd7AhYyW2EQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:EMPt7JR3gf0=:S8AqI1XqtLnnFZX8OG7Yuz
 NkWZtKuxqZ1sYuBpJppi3g+wf5lyOmQ+UW4xZAJqaw29JNemPHhLkL1dYwddWxZvLUhHZdwrM
 t88xU0FwyZw8XykjVXr6EmaK5+7ibhola49CqUijDy8uqjiWZIhZe1nOgv2/BYGnSBzZ2x+W4
 N5AQCGHUTg/3Fkkt043eUCGVANAJYw28gKjvuRysEeG/NhtURLsbBBfPBE67AyDyUJ74p7zTE
 rqx5BNGhOGSRCh2cWTMigNZ0SGBUQWiRoytYX8ccpaWC0Dk7Xk8t6sTtQ73fd1fdrsE2VNOSo
 FHYikLIkte9gWDxKXKpfJVHFFgL6i6wSrYe4yIHWMIqF7mTZLeCn2XqTNlK+EYczrFM69pDGj
 hjbFBsF0INuDFz6wbTtK7+uay0OwF7Co5cBx91a4aCPQJ4VC8GFIEJI0OAUmK
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
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
X-List-Received-Date: Sat, 20 Feb 2021 12:35:54 -0000

From: Gan Qixin <ganqixin@huawei.com>

The category of the nvdimm device is not set, put it into the 'storage'
category.

Signed-off-by: Gan Qixin <ganqixin@huawei.com>
Reviewed-by: Pankaj Gupta <pankaj.gupta@cloud.ionos.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20201130083630.2520597-5-ganqixin@huawei.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/mem/nvdimm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/mem/nvdimm.c b/hw/mem/nvdimm.c
index e0a9d606e1bc..7397b6715652 100644
--- a/hw/mem/nvdimm.c
+++ b/hw/mem/nvdimm.c
@@ -245,6 +245,7 @@ static void nvdimm_class_init(ObjectClass *oc, void *data)
 
     nvc->read_label_data = nvdimm_read_label_data;
     nvc->write_label_data = nvdimm_write_label_data;
+    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
 }
 
 static TypeInfo nvdimm_info = {
-- 
2.29.2


