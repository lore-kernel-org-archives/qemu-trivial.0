Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kZugi-0005mH-3F
	for mharc-qemu-trivial@gnu.org; Tue, 03 Nov 2020 06:41:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kZugg-0005ko-80
 for qemu-trivial@nongnu.org; Tue, 03 Nov 2020 06:41:18 -0500
Received: from 4.mo52.mail-out.ovh.net ([178.33.43.201]:33047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kZuga-0003Cz-7i
 for qemu-trivial@nongnu.org; Tue, 03 Nov 2020 06:41:17 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.171])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id CFEDA2030D1;
 Tue,  3 Nov 2020 12:40:58 +0100 (CET)
Received: from kaod.org (37.59.142.101) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Tue, 3 Nov 2020
 12:40:58 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G0043aa9208b-8673-4097-99bc-8ddec51a5bb0,
 C161C3821E84BD2E3FFA4C47F5A99552FEBD76C4) smtp.auth=groug@kaod.org
Date: Tue, 3 Nov 2020 12:40:57 +0100
From: Greg Kurz <groug@kaod.org>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
CC: <qemu-devel@nongnu.org>, Juan Quintela <quintela@redhat.com>,
 <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>, "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>, Dov Murik <dovmurik@linux.vnet.ibm.com>,
 <qemu-ppc@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>, David Gibson
 <david@gibson.dropbear.id.au>
Subject: Re: [PATCH-for-5.2 3/4] hw/ppc/spapr_tpm_proxy: Fix hexadecimal
 format string specifier
Message-ID: <20201103124057.38f6fe95@bahia.lan>
In-Reply-To: <20201103112558.2554390-4-philmd@redhat.com>
References: <20201103112558.2554390-1-philmd@redhat.com>
 <20201103112558.2554390-4-philmd@redhat.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: a8ad55e2-364a-4178-8c30-585e54b1e1fb
X-Ovh-Tracer-Id: 4740601560615918002
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedruddtfedgfeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfhisehtqhertdertdejnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeevlefhtddufffhieevhefhleegleelgfetffetkedugeehjeffgfehhfefueduffenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruh
Received-SPF: pass client-ip=178.33.43.201; envelope-from=groug@kaod.org;
 helo=4.mo52.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/03 06:41:00
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 03 Nov 2020 11:41:18 -0000

On Tue,  3 Nov 2020 12:25:57 +0100
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> The '%u' conversion specifier is for decimal notation.
> When prefixing a format with '0x', we want the hexadecimal
> specifier ('%x').
>=20
> Inspired-by: Dov Murik <dovmurik@linux.vnet.ibm.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  hw/ppc/trace-events | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/ppc/trace-events b/hw/ppc/trace-events
> index dcc06d49b5a..6d8d095aa28 100644
> --- a/hw/ppc/trace-events
> +++ b/hw/ppc/trace-events
> @@ -19,7 +19,7 @@ spapr_update_dt_failed_size(unsigned cbold, unsigned cb=
new, unsigned magic) "Old
>  spapr_update_dt_failed_check(unsigned cbold, unsigned cbnew, unsigned ma=
gic) "Old blob %u bytes, new blob %u bytes, magic 0x%x"
> =20
>  # spapr_tpm_proxy.c
> -spapr_h_tpm_comm(const char *device_path, uint64_t operation) "tpm_devic=
e_path=3D%s operation=3D0x%"PRIu64
> +spapr_h_tpm_comm(const char *device_path, uint64_t operation) "tpm_devic=
e_path=3D%s operation=3D0x%"PRIx64
>  spapr_tpm_execute(uint64_t data_in, uint64_t data_in_sz, uint64_t data_o=
ut, uint64_t data_out_sz) "data_in=3D0x%"PRIx64", data_in_sz=3D%"PRIu64", d=
ata_out=3D0x%"PRIx64", data_out_sz=3D%"PRIu64
> =20
>  # spapr_iommu.c


