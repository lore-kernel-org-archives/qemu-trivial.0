Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dIxPd-0001tV-LK
	for mharc-qemu-trivial@gnu.org; Thu, 08 Jun 2017 09:23:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42347)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1dIxPa-0001pe-VO
	for qemu-trivial@nongnu.org; Thu, 08 Jun 2017 09:23:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1dIxPa-0005Te-5w
	for qemu-trivial@nongnu.org; Thu, 08 Jun 2017 09:23:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54962)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1dIxPV-0005MA-IP; Thu, 08 Jun 2017 09:23:37 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5C3717D4EE;
	Thu,  8 Jun 2017 13:23:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 5C3717D4EE
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=pbonzini@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 5C3717D4EE
Received: from [10.36.117.229] (ovpn-117-229.ams2.redhat.com [10.36.117.229])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id v58DNW9I018250
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 8 Jun 2017 09:23:34 -0400
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Fam Zheng <famz@redhat.com>, qemu-trivial@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>, Eric Blake <eblake@redhat.com>
References: <1496926799-13040-1-git-send-email-thuth@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <151f982c-8e35-5dba-e40c-5b1c5d76b6d1@redhat.com>
Date: Thu, 8 Jun 2017 15:23:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <1496926799-13040-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 08 Jun 2017 13:23:36 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v3] Makefile: Do not generate files if
 "configure" has not been run yet
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Jun 2017 13:23:44 -0000



On 08/06/2017 14:59, Thomas Huth wrote:
> When doing a "make -j10" in the vanilla QEMU source tree (without
> running "configure" first), the Makefile currently generates two
> files already, qemu-version.h and qemu-options.def. This should not
> happen, so let's only build the generated files if config-host.mak
> is available (i.e. "configure" has been run already).
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  v3:
>  - Check for config-host.mak at the place where we add the dependencies
>    for $(GENERATED_FILES) instead of adding single dependencies all over
>    the place
> 
>  Makefile | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index c830d7a..32d4441 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -791,9 +791,11 @@ endif # CONFIG_WIN
>  
>  # Add a dependency on the generated files, so that they are always
>  # rebuilt before other object files
> +ifneq ($(wildcard config-host.mak),)
>  ifneq ($(filter-out $(UNCHECKED_GOALS),$(MAKECMDGOALS)),$(if $(MAKECMDGOALS),,fail))
>  Makefile: $(GENERATED_FILES)
>  endif
> +endif
>  
>  .SECONDARY: $(TRACE_HEADERS) $(TRACE_HEADERS:%=%-timestamp) \
>  	$(TRACE_SOURCES) $(TRACE_SOURCES:%=%-timestamp) \
> 

Thanks, queued.

Paolo

