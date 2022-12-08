Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p3H1d-00035S-Dv
	for mharc-qemu-trivial@gnu.org; Thu, 08 Dec 2022 08:33:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p3H1S-00032g-QZ
 for qemu-trivial@nongnu.org; Thu, 08 Dec 2022 08:33:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p3H1R-0002DG-CF
 for qemu-trivial@nongnu.org; Thu, 08 Dec 2022 08:33:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670506388;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Kdav0u8k+R0AJI9xpaKG/N9SaJnJ5p0mplwdWgcBboE=;
 b=WOWe7xpPgEOzo1E4Xb7mb9zv8cPzhJRcsk5o8VjvMiinpetHGkL8eGlZpAwfqgXLFZCqos
 1WrGRNn6GIB4aI+LwIVjRSKuxGP/smLfAtsfNAcMVTbKp78l6qfmlrOixzgonALpaMSIVz
 Sbfkdi3uNPvHw+5y0J2r++6YJKezwHE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-159-rN7Ny3DEOeeZQ2oUbcD_3w-1; Thu, 08 Dec 2022 08:33:03 -0500
X-MC-Unique: rN7Ny3DEOeeZQ2oUbcD_3w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0C1A087A9E6;
 Thu,  8 Dec 2022 13:33:03 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.214])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AE9E540C6EC2;
 Thu,  8 Dec 2022 13:33:01 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Stefan Weil <sw@weilnetz.de>
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-trivial@nongnu.org
Subject: [PATCH] util/oslib-win32: Remove obsolete reference to g_poll code
Date: Thu,  8 Dec 2022 14:32:57 +0100
Message-Id: <20221208133257.95673-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 08 Dec 2022 13:33:18 -0000

The comment about g_poll is not required here anymore since
the corresponding code has been removed a while ago already.

Fixes: b4c6036faa ("configure: bump min required glib version to 2.56")
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 util/oslib-win32.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/util/oslib-win32.c b/util/oslib-win32.c
index a67cb3822e..07ade41800 100644
--- a/util/oslib-win32.c
+++ b/util/oslib-win32.c
@@ -24,10 +24,6 @@
  * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
  * THE SOFTWARE.
- *
- * The implementation of g_poll (functions poll_rest, g_poll) at the end of
- * this file are based on code from GNOME glib-2 and use a different license,
- * see the license comment there.
  */
 
 #include "qemu/osdep.h"
-- 
2.31.1


