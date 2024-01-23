Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rSLQO-0001rH-QD
	for mharc-qemu-trivial@gnu.org; Tue, 23 Jan 2024 13:23:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rSLQN-0001po-06
 for qemu-trivial@nongnu.org; Tue, 23 Jan 2024 13:23:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rSLQL-00074s-BT
 for qemu-trivial@nongnu.org; Tue, 23 Jan 2024 13:23:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706034180;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KD/tlKWfIQ5rMILp5gWITV5ZqTPntnYk9/Os3uTJIdU=;
 b=Uqe+s6HhkAg2HDC4GOzWmR5RG+4VutX+q8aRyre3T0fV0T2alBcienAd9WP4Vu5kmac9l9
 M/49eRagC9HZ8twlyZQJVbu1XNQOkC7IhKPNhb4XDVRoyXtVCk8PupSZLg2qkF7mNNBDCk
 vRABPV2hgmhZTu8EYrDTya/PVK1bFo4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-376-oqJfgt-UPki_4MoX0Qqqtg-1; Tue, 23 Jan 2024 13:22:56 -0500
X-MC-Unique: oqJfgt-UPki_4MoX0Qqqtg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E3305837229;
 Tue, 23 Jan 2024 18:22:55 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.39.192.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A040F2166B32;
 Tue, 23 Jan 2024 18:22:54 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Stefan Weil <sw@weilnetz.de>, qemu-trivial@nongnu.org,
 qemu-block@nongnu.org
Subject: [PATCH v2 3/4] util/uri: Remove the uri_string_escape() function
Date: Tue, 23 Jan 2024 19:22:46 +0100
Message-ID: <20240123182247.432642-4-thuth@redhat.com>
In-Reply-To: <20240123182247.432642-1-thuth@redhat.com>
References: <20240123182247.432642-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.327,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Tue, 23 Jan 2024 18:23:03 -0000

Now that uri_resolve_relative() has been removed, this function is not
used in QEMU anymore - and if somebody needs this functionality, they
can simply use g_uri_escape_string() from the glib instead.

Reviewed-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: "Daniel P. Berrangé" <berrange@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 include/qemu/uri.h |  1 -
 util/uri.c         | 70 ----------------------------------------------
 2 files changed, 71 deletions(-)

diff --git a/include/qemu/uri.h b/include/qemu/uri.h
index 899ce852f5..255e61f452 100644
--- a/include/qemu/uri.h
+++ b/include/qemu/uri.h
@@ -76,7 +76,6 @@ URI *uri_parse(const char *str);
 URI *uri_parse_raw(const char *str, int raw);
 int uri_parse_into(URI *uri, const char *str);
 char *uri_to_string(URI *uri);
-char *uri_string_escape(const char *str, const char *list);
 void uri_free(URI *uri);
 
 /* Single web service query parameter 'name=value'. */
diff --git a/util/uri.c b/util/uri.c
index 1891ca6fb3..350835b03f 100644
--- a/util/uri.c
+++ b/util/uri.c
@@ -1349,76 +1349,6 @@ void uri_free(URI *uri)
     g_free(uri);
 }
 
-/************************************************************************
- *                                                                      *
- *                           Helper functions                           *
- *                                                                      *
- ************************************************************************/
-
-/**
- * uri_string_escape:
- * @str:  string to escape
- * @list: exception list string of chars not to escape
- *
- * This routine escapes a string to hex, ignoring reserved characters (a-z)
- * and the characters in the exception list.
- *
- * Returns a new escaped string or NULL in case of error.
- */
-char *uri_string_escape(const char *str, const char *list)
-{
-    char *ret, ch;
-    char *temp;
-    const char *in;
-    int len, out;
-
-    if (str == NULL) {
-        return NULL;
-    }
-    if (str[0] == 0) {
-        return g_strdup(str);
-    }
-    len = strlen(str);
-    if (!(len > 0)) {
-        return NULL;
-    }
-
-    len += 20;
-    ret = g_malloc(len);
-    in = str;
-    out = 0;
-    while (*in != 0) {
-        if (len - out <= 3) {
-            temp = realloc2n(ret, &len);
-            ret = temp;
-        }
-
-        ch = *in;
-
-        if ((ch != '@') && (!IS_UNRESERVED(ch)) && (!strchr(list, ch))) {
-            unsigned char val;
-            ret[out++] = '%';
-            val = ch >> 4;
-            if (val <= 9) {
-                ret[out++] = '0' + val;
-            } else {
-                ret[out++] = 'A' + val - 0xA;
-            }
-            val = ch & 0xF;
-            if (val <= 9) {
-                ret[out++] = '0' + val;
-            } else {
-                ret[out++] = 'A' + val - 0xA;
-            }
-            in++;
-        } else {
-            ret[out++] = *in++;
-        }
-    }
-    ret[out] = 0;
-    return ret;
-}
-
 /************************************************************************
  *                                                                      *
  *                           Public functions                           *
-- 
2.43.0


