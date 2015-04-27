Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yml9i-0001FH-F8
	for mharc-qemu-trivial@gnu.org; Mon, 27 Apr 2015 11:41:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46236)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1Yml9f-0001CV-2v
	for qemu-trivial@nongnu.org; Mon, 27 Apr 2015 11:41:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1Yml9b-0004ZT-Uj
	for qemu-trivial@nongnu.org; Mon, 27 Apr 2015 11:41:07 -0400
Received: from mail-wg0-x22a.google.com ([2a00:1450:400c:c00::22a]:35077)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1Yml9b-0004ZK-OO; Mon, 27 Apr 2015 11:41:03 -0400
Received: by wgyo15 with SMTP id o15so120463830wgy.2;
	Mon, 27 Apr 2015 08:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=CiPzBourYIpJkFgdx0OphZVAuF/vV3Tr6H+YuncBFh0=;
	b=X7+BWCbDh7xfsayefvf8Pp9I3rcA1k3JBEPKSjF5RVpuK3oaLs3AgqEC3m8xaNhdkT
	53OOJFwIt+KFn9uos5J2Fs69GIX+hUsuESY6/YnjuGUAQmfz8nQOLPDQp1zcZuPi7mBU
	k0cMKrFExIvgO5/6xPfY0nDdSW5jnm7Ct8Q2y/4iwS84ARnxbOJhZMNcs8+8ZV/kvlhK
	fQ3jk5A/unBVvyuDzy84REoZ6DWtfpVuA68uFEV4HXLJ1CKvR5qScpaKzohOAcGcq5e/
	6//PwNleKjNYMMnKBrmoL9S6qp4uMVtvxQ55FRbeS5l6ERChz8nDQiyfACVkDsWovhUl
	oTHw==
X-Received: by 10.180.107.70 with SMTP id ha6mr21407062wib.20.1430149263044;
	Mon, 27 Apr 2015 08:41:03 -0700 (PDT)
Received: from [192.168.10.165] (net-37-116-199-255.cust.vodafonedsl.it.
	[37.116.199.255]) by mx.google.com with ESMTPSA id
	jq3sm29919654wjc.22.2015.04.27.08.41.00
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Apr 2015 08:41:01 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <553E588B.7050603@redhat.com>
Date: Mon, 27 Apr 2015 17:40:59 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: "Emilio G. Cota" <cota@braap.org>, qemu-devel@nongnu.org
References: <1430085867-22514-1-git-send-email-cota@braap.org>
In-Reply-To: <1430085867-22514-1-git-send-email-cota@braap.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c00::22a
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	Laszlo Ersek <lersek@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] i440fx-test: remove ARRAY_SIZE
	redefinition
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 27 Apr 2015 15:41:08 -0000

On 27/04/2015 00:04, Emilio G. Cota wrote:
> It's defined in osdep.h and shouldn't be redefined here.
> 
> Signed-off-by: Emilio G. Cota <cota@braap.org>
> ---
>  tests/i440fx-test.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/tests/i440fx-test.c b/tests/i440fx-test.c
> index d0bc8de..33a7ecb 100644
> --- a/tests/i440fx-test.c
> +++ b/tests/i440fx-test.c
> @@ -27,8 +27,6 @@
>  
>  #define BROKEN 1
>  
> -#define ARRAY_SIZE(array) (sizeof(array) / sizeof((array)[0]))
> -
>  typedef struct TestData
>  {
>      int num_cpus;
> 

Looks good; I am CCing qemu-trivial@nongnu.org so that Michael will
notice this patch.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

Paolo

