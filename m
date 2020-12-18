Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kqH7o-0004sB-KP
	for mharc-qemu-trivial@gnu.org; Fri, 18 Dec 2020 09:52:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ptr@void-ptr.info>) id 1kqBp3-0003yX-MQ
 for qemu-trivial@nongnu.org; Fri, 18 Dec 2020 04:13:13 -0500
Received: from [185.44.68.223] (port=59866 helo=void-ptr.info)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ptr@void-ptr.info>) id 1kqBp2-0007Z1-9E
 for qemu-trivial@nongnu.org; Fri, 18 Dec 2020 04:13:13 -0500
Received: from ptr by void-ptr.info with local (Exim 4.94-23-08f2e6366)
 (envelope-from <ptr@void-ptr.info>)
 id 1kqBXf-0003x5-R3; Fri, 18 Dec 2020 11:55:15 +0300
From: Petr Ovtchenkov <ptr@void-ptr.info>
To: qemu-trivial@nongnu.org
Cc: Petr Ovtchenkov <ptr@void-ptr.info>
Subject: [PATCH 1/1] replace ASN1 deprecated macros
Date: Fri, 18 Dec 2020 11:55:05 +0300
Message-Id: <20201218085505.15134-2-ptr@void-ptr.info>
X-Mailer: git-send-email 2.29.2.1.g08c1adf7b9
In-Reply-To: <20201218085505.15134-1-ptr@void-ptr.info>
References: <20201218085505.15134-1-ptr@void-ptr.info>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 185.44.68.223 (failed)
Received-SPF: none client-ip=185.44.68.223; envelope-from=ptr@void-ptr.info;
 helo=void-ptr.info
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 18 Dec 2020 09:52:55 -0500
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
X-List-Received-Date: Fri, 18 Dec 2020 09:13:13 -0000

Follow recommendation from libtasn1.h for deprecated macros.

Signed-off-by: Petr Ovtchenkov <ptr@void-ptr.info>
---
 tests/crypto-tls-x509-helpers.c | 10 +++++-----
 tests/crypto-tls-x509-helpers.h |  2 +-
 tests/pkix_asn1_tab.c           |  2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/tests/crypto-tls-x509-helpers.c b/tests/crypto-tls-x509-helpers.c
index 01b3daf358..97658592a2 100644
--- a/tests/crypto-tls-x509-helpers.c
+++ b/tests/crypto-tls-x509-helpers.c
@@ -30,7 +30,7 @@
  * This stores some static data that is needed when
  * encoding extensions in the x509 certs
  */
-ASN1_TYPE pkix_asn1;
+asn1_node pkix_asn1;
 
 /*
  * To avoid consuming random entropy to generate keys,
@@ -139,7 +139,7 @@ void test_tls_cleanup(const char *keyfile)
 /*
  * Turns an ASN1 object into a DER encoded byte array
  */
-static void test_tls_der_encode(ASN1_TYPE src,
+static void test_tls_der_encode(asn1_node src,
                                 const char *src_name,
                                 gnutls_datum_t *res)
 {
@@ -317,7 +317,7 @@ test_tls_generate_cert(QCryptoTLSTestCertReq *req,
      * the 'critical' field which we want control over
      */
     if (req->basicConstraintsEnable) {
-        ASN1_TYPE ext = ASN1_TYPE_EMPTY;
+        asn1_node ext = NULL;
 
         asn1_create_element(pkix_asn1, "PKIX1.BasicConstraints", &ext);
         asn1_write_value(ext, "cA",
@@ -344,7 +344,7 @@ test_tls_generate_cert(QCryptoTLSTestCertReq *req,
      * to be 'critical'
      */
     if (req->keyUsageEnable) {
-        ASN1_TYPE ext = ASN1_TYPE_EMPTY;
+        asn1_node ext = NULL;
         char str[2];
 
         str[0] = req->keyUsageValue & 0xff;
@@ -374,7 +374,7 @@ test_tls_generate_cert(QCryptoTLSTestCertReq *req,
      * set this the hard way building up ASN1 data ourselves
      */
     if (req->keyPurposeEnable) {
-        ASN1_TYPE ext = ASN1_TYPE_EMPTY;
+        asn1_node ext = NULL;
 
         asn1_create_element(pkix_asn1, "PKIX1.ExtKeyUsageSyntax", &ext);
         if (req->keyPurposeOID1) {
diff --git a/tests/crypto-tls-x509-helpers.h b/tests/crypto-tls-x509-helpers.h
index 08efba4e19..8fcd7785ab 100644
--- a/tests/crypto-tls-x509-helpers.h
+++ b/tests/crypto-tls-x509-helpers.h
@@ -125,7 +125,7 @@ void test_tls_cleanup(const char *keyfile);
     };                                                                  \
     test_tls_generate_cert(&varname, NULL)
 
-extern const ASN1_ARRAY_TYPE pkix_asn1_tab[];
+extern const asn1_static_node pkix_asn1_tab[];
 
 #endif /* QCRYPTO_HAVE_TLS_TEST_SUPPORT */
 
diff --git a/tests/pkix_asn1_tab.c b/tests/pkix_asn1_tab.c
index f15fc515cb..4aaf736d3f 100644
--- a/tests/pkix_asn1_tab.c
+++ b/tests/pkix_asn1_tab.c
@@ -8,7 +8,7 @@
 
 #ifdef QCRYPTO_HAVE_TLS_TEST_SUPPORT
 
-const ASN1_ARRAY_TYPE pkix_asn1_tab[] = {
+const asn1_static_node pkix_asn1_tab[] = {
   {"PKIX1", 536875024, 0},
   {0, 1073741836, 0},
   {"id-ce", 1879048204, 0},
-- 
2.29.2.1.g08c1adf7b9


