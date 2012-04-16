Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SJhm7-0005nu-N7
	for mharc-qemu-trivial@gnu.org; Mon, 16 Apr 2012 04:59:07 -0400
Received: from eggs.gnu.org ([208.118.235.92]:53888)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1SJhm4-0005jf-Rr
	for qemu-trivial@nongnu.org; Mon, 16 Apr 2012 04:59:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1SJhlv-0003QS-7Z
	for qemu-trivial@nongnu.org; Mon, 16 Apr 2012 04:59:04 -0400
Received: from mail-pz0-f46.google.com ([209.85.210.46]:35497)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1SJhlu-0003PR-V2; Mon, 16 Apr 2012 04:58:55 -0400
Received: by dadz9 with SMTP id z9so7645085dad.33
	for <multiple recipients>; Mon, 16 Apr 2012 01:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=Bg9uAvcFfiYJZv+z6NnzylOWMgAPqaxZnwSsGy9zx70=;
	b=T3qpc5oA5F7WT5lT5jV3Dt6/MnAZp2cxoOAnGEhXfd6GgpLihsHxO23Yc4r53B0Mp3
	aYx7e4taws7yBSexa2UAddKhGTfDb8H0xxK9YB7KgXmYQdMzH76bGUt2eg5oDu4a7D6V
	obGPHIIMfXJJ0cGaYgSam6eJ46l6WauhmSL6L7Dt1C3XHdTNrqay47gtz20e4OcVBmfT
	ma5JkhKmCJu1Fw+IVqqRcRS2YLSBvpXByNPlUStCNOxV4ftQ5uCWF8yhZQPsXS8hpKSM
	zsFMMBQvCjBJYA6AVpnTU7rp9nJXdUGJRyWNitGmGQGXyP9kzDWi7CY23Bd36HMtLxkH
	g1Bg==
Received: by 10.68.221.133 with SMTP id qe5mr27002306pbc.24.1334566732258;
	Mon, 16 Apr 2012 01:58:52 -0700 (PDT)
Received: from yakj.usersys.redhat.com (93-34-182-16.ip50.fastwebnet.it.
	[93.34.182.16])
	by mx.google.com with ESMTPS id vr9sm2596485pbc.38.2012.04.16.01.58.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 Apr 2012 01:58:51 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <4F8BDF46.3050305@redhat.com>
Date: Mon, 16 Apr 2012 10:58:46 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Amos Kong <akong@redhat.com>
References: <20120416073249.13295.65065.stgit@dhcp-8-167.nay.redhat.com>
In-Reply-To: <20120416073249.13295.65065.stgit@dhcp-8-167.nay.redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.210.46
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, stefanha@linux.vnet.ibm.com
Subject: Re: [Qemu-trivial] [PATCH] error.c: don't return value for void
	function
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
X-List-Received-Date: Mon, 16 Apr 2012 08:59:06 -0000

Il 16/04/2012 09:32, Amos Kong ha scritto:
> It is invalid to return a value from a function
> returning void.
> 
> Signed-off-by: Amos Kong <akong@redhat.com>
> ---
>  error.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/error.c b/error.c
> index d3455ab..a52b771 100644
> --- a/error.c
> +++ b/error.c
> @@ -93,7 +93,7 @@ QDict *error_get_data(Error *err)
>  void error_set_field(Error *err, const char *field, const char *value)
>  {
>      QDict *dict = qdict_get_qdict(err->obj, "data");
> -    return qdict_put(dict, field, qstring_from_str(value));
> +    qdict_put(dict, field, qstring_from_str(value));
>  }
>  
>  void error_free(Error *err)

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>




