Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vtue8-000177-Nj
	for mharc-qemu-trivial@gnu.org; Fri, 20 Dec 2013 02:37:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58566)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1Vtudy-0000ui-BN
	for qemu-trivial@nongnu.org; Fri, 20 Dec 2013 02:37:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1Vtudp-0005em-Tw
	for qemu-trivial@nongnu.org; Fri, 20 Dec 2013 02:37:10 -0500
Received: from mail-ea0-x230.google.com ([2a00:1450:4013:c01::230]:57498)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1VtudY-0005du-ME; Fri, 20 Dec 2013 02:36:44 -0500
Received: by mail-ea0-f176.google.com with SMTP id h14so846411eaj.21
	for <multiple recipients>; Thu, 19 Dec 2013 23:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=YwLLZ7bpPFgiDcfvdZMcaWMvu1DpSEBN5IZYyuN0b5M=;
	b=v/IVb1cdx8aB1mg/ZLTjADkhFZEQWYi8fMo2P88mVW8PESZyGBwQ2EsCb8cwwCUhmW
	SgXbCi8gC+oGCvjfut5i15GQJyF2yx+FMp/tlsRlQoyNdBuZ0IHO69gXfDL6TM4yaGRi
	4wlaig3XyomgmeX/DK+gitFlzLTWfZ0ZCHj3Q4mU7Sb/tEQGjGOkjIejRY9jfXVdkycd
	g0CiIBOS+XPwJ1ov6EC3ZfhEj8+tSdOSKX2f9UUgZdvoI7PGM+ASJMUTTST8Jt5/u7iu
	T2LhHEeCCDbue7/4IqtUaxqoN8HQTwuJQrMaJeAvQHVPEzXBD8/ElptcLFZCS5XLF2lX
	eBVg==
X-Received: by 10.14.246.202 with SMTP id q50mr1125478eer.58.1387525003593;
	Thu, 19 Dec 2013 23:36:43 -0800 (PST)
Received: from yakj.usersys.redhat.com
	(net-37-116-200-88.cust.dsl.vodafone.it. [37.116.200.88])
	by mx.google.com with ESMTPSA id v7sm16074680eel.2.2013.12.19.23.36.41
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 19 Dec 2013 23:36:42 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <52B3F388.4090402@redhat.com>
Date: Fri, 20 Dec 2013 08:36:40 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130923 Thunderbird/17.0.9
MIME-Version: 1.0
To: Fam Zheng <famz@redhat.com>
References: <1387523131-15647-1-git-send-email-famz@redhat.com>
In-Reply-To: <1387523131-15647-1-git-send-email-famz@redhat.com>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4013:c01::230
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.a@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] acpi unit-test: Create temporary disk
	file under /tmp
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
X-List-Received-Date: Fri, 20 Dec 2013 07:37:18 -0000

Il 20/12/2013 08:05, Fam Zheng ha scritto:
> As other tests, the image file is created in /tmp other than current
> dir. Thus there will not be an unignored file under tests for intree
> build.
> 
> Signed-off-by: Fam Zheng <famz@redhat.com>
> ---
>  tests/acpi-test.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/acpi-test.c b/tests/acpi-test.c
> index ca83b1d6..e4f31b7 100644
> --- a/tests/acpi-test.c
> +++ b/tests/acpi-test.c
> @@ -116,7 +116,7 @@ static uint8_t boot_sector[0x200] = {
>      [0x1FF] = 0xAA,
>  };
>  
> -static const char *disk = "tests/acpi-test-disk.raw";
> +static const char *disk = "/tmp/qtest-acpi-test-disk.raw";
>  
>  static void free_test_data(test_data *data)
>  {
> 

The real bug is probably that the file is not unlinked.

Using /tmp is a good idea, but if you do that you probably need to take
TMPDIR into account.

Paolo

