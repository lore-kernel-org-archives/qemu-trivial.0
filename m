Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nZzMW-0005t9-Dm
	for mharc-qemu-trivial@gnu.org; Thu, 31 Mar 2022 14:17:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nZzMT-0005pD-NL
 for qemu-trivial@nongnu.org; Thu, 31 Mar 2022 14:17:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nZzMR-0001t1-Os
 for qemu-trivial@nongnu.org; Thu, 31 Mar 2022 14:17:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648750651;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4hRd/1JFpc+TVhaJIVv0c3bcCXb/Sz/bn/9yvm/rPhA=;
 b=DRcirdVwruW3qh+l3Nbi2BsPD2gsy64dL4S1+zfAxXu0EMA8AGk7FIcgOqr5FbSF578emt
 rvhxK8WT1dJWMM+wuBXUH99lcgJk2tu2AC22mp5fyhdRYJjRaoLV6vkNeRUS770xhcEXWK
 9AmeOq9RIKShb+PQr/P9e7Fq9hGtqn8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-245-4-FFH4RmOcuP7UphUGxzlQ-1; Thu, 31 Mar 2022 14:17:28 -0400
X-MC-Unique: 4-FFH4RmOcuP7UphUGxzlQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9755E382221C;
 Thu, 31 Mar 2022 18:17:15 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.194.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 793031400B18;
 Thu, 31 Mar 2022 18:17:14 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, qemu-trivial@nongnu.org,
 Peter Xu <peterx@redhat.com>
Subject: [PATCH] util: Return void on iova_tree_remove
Date: Thu, 31 Mar 2022 20:17:12 +0200
Message-Id: <20220331181712.535039-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 31 Mar 2022 18:17:35 -0000

It always returns IOVA_OK so nobody uses it.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 include/qemu/iova-tree.h | 4 +---
 util/iova-tree.c         | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/include/qemu/iova-tree.h b/include/qemu/iova-tree.h
index c938fb0793..16bbfdf5f8 100644
--- a/include/qemu/iova-tree.h
+++ b/include/qemu/iova-tree.h
@@ -72,10 +72,8 @@ int iova_tree_insert(IOVATree *tree, const DMAMap *map);
  * provided.  The range does not need to be exactly what has inserted,
  * all the mappings that are included in the provided range will be
  * removed from the tree.  Here map->translated_addr is meaningless.
- *
- * Return: 0 if succeeded, or <0 if error.
  */
-int iova_tree_remove(IOVATree *tree, const DMAMap *map);
+void iova_tree_remove(IOVATree *tree, const DMAMap *map);

 /**
  * iova_tree_find:
diff --git a/util/iova-tree.c b/util/iova-tree.c
index 6dff29c1f6..fee530a579 100644
--- a/util/iova-tree.c
+++ b/util/iova-tree.c
@@ -164,15 +164,13 @@ void iova_tree_foreach(IOVATree *tree, iova_tree_iterator iterator)
     g_tree_foreach(tree->tree, iova_tree_traverse, iterator);
 }

-int iova_tree_remove(IOVATree *tree, const DMAMap *map)
+void iova_tree_remove(IOVATree *tree, const DMAMap *map)
 {
     const DMAMap *overlap;

     while ((overlap = iova_tree_find(tree, map))) {
         g_tree_remove(tree->tree, overlap);
     }
-
-    return IOVA_OK;
 }

 /**
--
2.27.0


