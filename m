Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ipBCU-0001ed-Na
	for mharc-qemu-trivial@gnu.org; Wed, 08 Jan 2020 08:16:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60120)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1ipBCR-0001ck-Uq
 for qemu-trivial@nongnu.org; Wed, 08 Jan 2020 08:16:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1ipBCQ-0007De-Ve
 for qemu-trivial@nongnu.org; Wed, 08 Jan 2020 08:16:39 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:30845
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1ipBBy-0006v3-E1
 for qemu-trivial@nongnu.org; Wed, 08 Jan 2020 08:16:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578489366;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nPcmk0b6yRUBu9FYvwhg+6bf/76SqxpUR2t7+mUQVoE=;
 b=eJ+vF545fKmhYhBMffs9C8XK7FeFP8N/+ZyW4laUqbD6w6QSmZ6oNfzWXRJowRfCtHiTFz
 be42dueKz0FdMAjUmSAquCOdXMlTKy52UVyYG1FqPNEFrTGebj8QO2XbNyYTCgAXRLf6m9
 /IaYwBXwrkCJQYhHz8DPHYz+lABJSjc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-123-5frj8CK_OQOzT6ZooWMIyw-1; Wed, 08 Jan 2020 08:16:04 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D6AE800D41;
 Wed,  8 Jan 2020 13:16:03 +0000 (UTC)
Received: from gondolin (dhcp-192-245.str.redhat.com [10.33.192.245])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 65BC65C1B0;
 Wed,  8 Jan 2020 13:16:02 +0000 (UTC)
Date: Wed, 8 Jan 2020 14:16:00 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, Halil Pasic
 <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@de.ibm.com>,
 qemu-s390x@nongnu.org
Subject: Re: [PATCH v1 38/59] s390x/sclp.c: remove unneeded label in
 sclp_service_call()
Message-ID: <20200108141600.23c879c0.cohuck@redhat.com>
In-Reply-To: <20200106182425.20312-39-danielhb413@gmail.com>
References: <20200106182425.20312-1-danielhb413@gmail.com>
 <20200106182425.20312-39-danielhb413@gmail.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: 5frj8CK_OQOzT6ZooWMIyw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
X-List-Received-Date: Wed, 08 Jan 2020 13:16:41 -0000

On Mon,  6 Jan 2020 15:24:04 -0300
Daniel Henrique Barboza <danielhb413@gmail.com> wrote:

> 'out' label can be replaced by 'return' with the appropriate
> value. The 'r' integer, which is used solely to set the
> return value for this label, can also be removed.
> 
> CC: Cornelia Huck <cohuck@redhat.com>
> CC: Halil Pasic <pasic@linux.ibm.com>
> CC: Christian Borntraeger <borntraeger@de.ibm.com>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  hw/s390x/sclp.c | 16 +++++-----------
>  1 file changed, 5 insertions(+), 11 deletions(-)

Thanks, applied.


