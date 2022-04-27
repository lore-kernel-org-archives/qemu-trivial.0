Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1njjvD-0004wo-HI
	for mharc-qemu-trivial@gnu.org; Wed, 27 Apr 2022 11:49:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1njjvB-0004wX-Th
 for qemu-trivial@nongnu.org; Wed, 27 Apr 2022 11:49:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1njjv9-0003RZ-9V
 for qemu-trivial@nongnu.org; Wed, 27 Apr 2022 11:49:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651074577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=W/qhRcfWJ5m7eG6NvVgfeOyjdRT3Z2CLIxEFo6gpWS4=;
 b=Ftkt15pcg1Iu7zciaUdK2+2k33vyhHo451yhRtnm8sYiY/iWYD8AGjzMv4YaaEQ/anpo4D
 K7h+OWQYBH+sL4vNiLidodGO8Tc6xqPKXLNYQEgoZH7BabGxvsE8TmHOYNmvbNeTd5RTFP
 H8kWiBtIynooVYRX056EjossMFyZVug=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-629-iHykN2LcMjun5PO9dTGQQA-1; Wed, 27 Apr 2022 11:49:36 -0400
X-MC-Unique: iHykN2LcMjun5PO9dTGQQA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A4DF51014A61;
 Wed, 27 Apr 2022 15:49:35 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.193.84])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8BC7540CFD05;
 Wed, 27 Apr 2022 15:49:34 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, qemu-trivial@nongnu.org,
 Jason Wang <jasowang@redhat.com>, lvivier@redhat.com
Subject: [PATCH] util: Return void on iova_tree_remove
Date: Wed, 27 Apr 2022 17:49:31 +0200
Message-Id: <20220427154931.3166388-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 27 Apr 2022 15:49:42 -0000

It always returns IOVA_OK so nobody uses it.

Acked-by: Jason Wang <jasowang@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
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


