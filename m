Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dz1GD-0003vF-Gj
	for mharc-qemu-trivial@gnu.org; Mon, 02 Oct 2017 09:59:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39208)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1dz1GB-0003tp-E9
	for qemu-trivial@nongnu.org; Mon, 02 Oct 2017 09:59:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1dz1GA-0002JQ-Ml
	for qemu-trivial@nongnu.org; Mon, 02 Oct 2017 09:59:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47604)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1dz1G3-0002FS-77; Mon, 02 Oct 2017 09:59:43 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0A4BA7F413;
	Mon,  2 Oct 2017 13:59:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 0A4BA7F413
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=armbru@redhat.com
Received: from blackfin.pond.sub.org (ovpn-116-91.ams2.redhat.com
	[10.36.116.91])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CCA3511A4D9;
	Mon,  2 Oct 2017 13:59:41 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id B7A691132D34; Mon,  2 Oct 2017 15:59:39 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-trivial@nongnu.org
Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>, qemu-devel@nongnu.org,
	f4bug@amsat.org
References: <1504815384-8490-1-git-send-email-stefanb@linux.vnet.ibm.com>
Date: Mon, 02 Oct 2017 15:59:39 +0200
In-Reply-To: <1504815384-8490-1-git-send-email-stefanb@linux.vnet.ibm.com>
	(Stefan Berger's message of "Thu, 7 Sep 2017 16:16:24 -0400")
Message-ID: <877ewdfy5w.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Mon, 02 Oct 2017 13:59:42 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] Add myself as maintainer
 for TPM code
X-BeenThere: qemu-trivial@gnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.gnu.org>
List-Unsubscribe: <https://lists.gnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@gnu.org?subject=unsubscribe>
List-Archive: <http://lists.gnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@gnu.org>
List-Help: <mailto:qemu-trivial-request@gnu.org?subject=help>
List-Subscribe: <https://lists.gnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@gnu.org?subject=subscribe>
X-List-Received-Date: Mon, 02 Oct 2017 13:59:52 -0000

Copying qemu-trivial.

Stefan Berger <stefanb@linux.vnet.ibm.com> writes:

> Also add backends/tpm.c to the list of files.
>
> Signed-off-by: Stefan Berger <stefanb@linux.vnet.ibm.com>
> ---
>  MAINTAINERS | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index caf7e8a..c434a09 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1487,12 +1487,14 @@ F: docs/tracing.txt
>  T: git git://github.com/stefanha/qemu.git tracing
>  
>  TPM
> -S: Orphan
> +M: Stefan Berger <stefanb@linux.vnet.ibm.com>
> +S: Maintained
>  F: tpm.c
>  F: hw/tpm/*
>  F: include/hw/acpi/tpm.h
>  F: include/sysemu/tpm*
>  F: qapi/tpm.json
> +F: backends/tpm.c
>  
>  Checkpatch
>  S: Odd Fixes

