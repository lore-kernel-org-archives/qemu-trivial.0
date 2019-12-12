Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ifIfM-0002vs-9w
	for mharc-qemu-trivial@gnu.org; Thu, 12 Dec 2019 02:13:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48791)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1ifIfJ-0002uo-QO
 for qemu-trivial@nongnu.org; Thu, 12 Dec 2019 02:13:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1ifIfI-0002bo-PF
 for qemu-trivial@nongnu.org; Thu, 12 Dec 2019 02:13:37 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:53246
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1ifIfI-0002aN-KZ
 for qemu-trivial@nongnu.org; Thu, 12 Dec 2019 02:13:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576134816;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=2nwA8y5P+ItZHjQKY4472/tbtCDMewvaqNvIDI8E6Pw=;
 b=Xb27jmjPyly45Ax2NgIZXYzWaR0rxb2ChXtE0trn/JrkNjU6gnfiDrrZUj/7KghXzFlVZT
 A1k3CxzB1veP5p52ERuez+VCSpkhtE63CtPlaDFMUZ0nmp5bCeJeP19T9wayBE323pVuGG
 ZWTgK3OcfzCOV7NbdtFlNlKgU88TzRk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-96-OjpK6ojNOdaH8W1W5xaihQ-1; Thu, 12 Dec 2019 02:13:34 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 90903107ACC4;
 Thu, 12 Dec 2019 07:13:33 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-168.ams2.redhat.com [10.36.116.168])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D46877009;
 Thu, 12 Dec 2019 07:13:29 +0000 (UTC)
Subject: Re: [PATCH 1/1] tests/Makefile: Fix check-report.* targets shown in
 check-help
To: Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20191211204427.4681-1-wainersm@redhat.com>
 <20191211204427.4681-2-wainersm@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <3bff7e70-3b20-2e4b-b57f-9d529ab6378c@redhat.com>
Date: Thu, 12 Dec 2019 08:13:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191211204427.4681-2-wainersm@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: OjpK6ojNOdaH8W1W5xaihQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
X-List-Received-Date: Thu, 12 Dec 2019 07:13:38 -0000

On 11/12/2019 21.44, Wainer dos Santos Moschetta wrote:
> The check-report.html and check-report.xml targets were replaced
> with check-report.tap in commit 9df43317b82 but the check-help
> text was not updated so it still lists check-report.html.
> 
> Fixes: 9df43317b82
> Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> ---
>  tests/Makefile.include | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/tests/Makefile.include b/tests/Makefile.include
> index 8566f5f119..680bd8a669 100644
> --- a/tests/Makefile.include
> +++ b/tests/Makefile.include
> @@ -16,12 +16,10 @@ check-help:
>  	@echo " $(MAKE) check-softfloat      Run FPU emulation tests"
>  	@echo " $(MAKE) check-acceptance     Run all acceptance (functional) tests"
>  	@echo
> -	@echo " $(MAKE) check-report.html    Generates an HTML test report"
> +	@echo " $(MAKE) check-report.tap     Generates an aggregated TAP test report"
>  	@echo " $(MAKE) check-venv           Creates a Python venv for tests"
>  	@echo " $(MAKE) check-clean          Clean the tests and related data"
>  	@echo
> -	@echo "Please note that HTML reports do not regenerate if the unit tests"
> -	@echo "have not changed."
>  	@echo
>  	@echo "The variable SPEED can be set to control the gtester speed setting."
>  	@echo "Default options are -k and (for $(MAKE) V=1) --verbose; they can be"
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


