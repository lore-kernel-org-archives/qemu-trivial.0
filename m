Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ezKC3-00087X-83
	for mharc-qemu-trivial@gnu.org; Fri, 23 Mar 2018 06:45:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60271)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berto@igalia.com>) id 1ezKC0-00085J-Fm
	for qemu-trivial@nongnu.org; Fri, 23 Mar 2018 06:45:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berto@igalia.com>) id 1ezKBz-0006Zs-ND
	for qemu-trivial@nongnu.org; Fri, 23 Mar 2018 06:45:04 -0400
Received: from fanzine.igalia.com ([91.117.99.155]:50761)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <berto@igalia.com>)
	id 1ezKBt-0006Wn-DU; Fri, 23 Mar 2018 06:44:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; 
	h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
	bh=LpWFodY1TdUqeh2VefxDw9UoD9Azr1tnef9/sk+HkVQ=; 
	b=dD7aftoFHjISkys6gH5yo+qXZqZ4BXakA4GdUh6++rGz9MRx2wuwx2fjw79chUJq6Bp9vICSnF1cE9nPSghUG8DdvDqLcY/FqKKTSRVHCrvXDXwNiEVDX7bb0PbH+DSdlJyMav8WAa1RgKPTt/R12qjSMRQ3wNoRpiwgGaSTPzSg07VGERPEIZl3aj1eE5SRy01CXImB1rtJp7O83Aa1pFj+90+TuJAQv2jz4N/6cMLc+vbZ24lCdzRanBPV8jaoMaW6Ft/raVBh9XEozzyAgCexh9wEmlE3Tlo7467UIAe6sWW6BB0Y4VWovyB9tr4bDoMie1CbvbIRQxHZC0aw5A==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine.igalia.com with esmtps 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1ezKBm-0000Hr-6T; Fri, 23 Mar 2018 11:44:50 +0100
Received: from berto by mail.igalia.com with local (Exim)
	id 1ezKBm-0003Ri-3n; Fri, 23 Mar 2018 11:44:50 +0100
From: Alberto Garcia <berto@igalia.com>
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Crosthwaite <crosthwaite.peter@gmail.com>, =?utf-8?Q?Daniel_P=2E?=
	=?utf-8?Q?_Berrang=C3=A9?= <berrange@redhat.com>, "Dr. David Alan Gilbert"
	<dgilbert@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, David Gibson
	<david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>, Richard
	Henderson <rth@twiddle.net>, qemu-arm@nongnu.org, Eric Blake
	<eblake@redhat.com>, Jason Wang <jasowang@redhat.com>, Max Reitz
	<mreitz@redhat.com>, Fam Zheng <famz@redhat.com>, qemu-trivial@nongnu.org, 
	Alexander Graf <agraf@suse.de>, qemu-ppc@nongnu.org, Peter Maydell
	<peter.maydell@linaro.org>, qemu-block@nongnu.org, Igor Mitsyanko
	<i.mitsyanko@gmail.com>, Yongbok Kim <yongbok.kim@mips.com>, "Michael S.
	Tsirkin" <mst@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>, Eduardo
	Habkost <ehabkost@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>, Markus
	Armbruster <armbru@redhat.com>, Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <20180322161226.29796-5-lvivier@redhat.com>
References: <20180322161226.29796-1-lvivier@redhat.com>
	<20180322161226.29796-5-lvivier@redhat.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
	(i586-pc-linux-gnu)
Date: Fri, 23 Mar 2018 11:44:49 +0100
Message-ID: <w51lgejt6ji.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic] [fuzzy]
X-Received-From: 91.117.99.155
Subject: Re: [Qemu-trivial] [PATCH 4/4] Remove unnecessary variables for
 function return value
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
X-List-Received-Date: Fri, 23 Mar 2018 10:45:05 -0000

On Thu 22 Mar 2018 05:12:26 PM CET, Laurent Vivier wrote:

> diff --git a/block/quorum.c b/block/quorum.c
> index 14333c18aa..304442ef65 100644
> --- a/block/quorum.c
> +++ b/block/quorum.c
> @@ -608,7 +608,7 @@ static void read_quorum_children_entry(void *opaque)
>  static int read_quorum_children(QuorumAIOCB *acb)
>  {
>      BDRVQuorumState *s = acb->bs->opaque;
> -    int i, ret;
> +    int i;
>  
>      acb->children_read = s->num_children;
>      for (i = 0; i < s->num_children; i++) {
> @@ -643,9 +643,7 @@ static int read_quorum_children(QuorumAIOCB *acb)
>          qemu_coroutine_yield();
>      }
>  
> -    ret = acb->vote_ret;
> -
> -    return ret;
> +    return acb->vote_ret;
>  }

The Quorum part,

Reviewed-by: Alberto Garcia <berto@igalia.com>

Berto

