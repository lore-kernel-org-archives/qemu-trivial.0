Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UZOLY-0007zo-Qa
	for mharc-qemu-trivial@gnu.org; Mon, 06 May 2013 12:33:05 -0400
Received: from eggs.gnu.org ([208.118.235.92]:56397)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1UZOLV-0007uo-S2
	for qemu-trivial@nongnu.org; Mon, 06 May 2013 12:33:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1UZOLS-0000Uj-00
	for qemu-trivial@nongnu.org; Mon, 06 May 2013 12:32:58 -0400
Received: from mail-yh0-x230.google.com ([2607:f8b0:4002:c01::230]:38443)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1UZOLP-0000Tr-2j; Mon, 06 May 2013 12:32:55 -0400
Received: by mail-yh0-f48.google.com with SMTP id f35so729376yha.35
	for <multiple recipients>; Mon, 06 May 2013 09:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=fMdN1evOOYQHrnVEAkVhAwpkhMWP56ns0YQwRSMVVFg=;
	b=tyjhNKhkEoeaiLEY5KZcRDaEVkWfT8Fxt59LGzjttD8QETNxVElR1aw0nL3XjCNqK1
	6DhkguGQpKhdM9pRgkpA0yjXpcUG+23cTJwLcnjRu5zRobb6xpqivxwWsum5+bWLPsh+
	9j4elRpsyHaO2tpiOYXUvIMeHjUad5Ho5x+dq3G7w7gHBxVVWiX3UEZYFiu0igUMkfho
	A869KlkvaKchvCYLUPBtGfRcvYlVqhjbuSpuA2AylsRJOBwVk7Vgw2QjOV8/mN9OAhY8
	ueDQdh76piIaNdk3/Ju//mLJr6EV/whA3AEPiB9SJLdbcLd3Yt+UEboRZaT+Z2gi/p8Q
	vapw==
X-Received: by 10.236.134.194 with SMTP id s42mr18462092yhi.181.1367857974668; 
	Mon, 06 May 2013 09:32:54 -0700 (PDT)
Received: from yakj.usersys.redhat.com (93-34-176-20.ip50.fastwebnet.it.
	[93.34.176.20])
	by mx.google.com with ESMTPSA id w67sm48611611yhk.7.2013.05.06.09.32.52
	for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 06 May 2013 09:32:53 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <5187DB2D.9080402@redhat.com>
Date: Mon, 06 May 2013 18:32:45 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130311 Thunderbird/17.0.4
MIME-Version: 1.0
To: Jan Kiszka <jan.kiszka@siemens.com>
References: <5187D656.2090501@siemens.com>
In-Reply-To: <5187D656.2090501@siemens.com>
X-Enigmail-Version: 1.5.1
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4002:c01::230
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] memory: Rename readable flag to romd_mode
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
X-List-Received-Date: Mon, 06 May 2013 16:33:03 -0000

Il 06/05/2013 18:12, Jan Kiszka ha scritto:
> "Readable" is a very unfortunate name for this flag because even a
> rom_device region will always be readable from the guest POV. What
> differs is the mapping, just like the comments had to explain already.
> Also, readable could currently be understood as being a generic region
> flag, but it only applies to rom_device regions.
> 
> So name the flag and the function to modify it after the original term
> "ROMD" which could also be interpreted as "ROM direct", i.e. ROM mode
> with direct access. In any case, the scope if the flag is clearer now.
> 
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
> 
> Depends on "memory: Replace open-coded memory_region_is_romd", but I
> don't think this patch is "trivial" as well, though it is just renaming
> things. Just in case, I'm CCing the trivial list as well.
> 
> Paolo, or would you open a memory branch so that related stuff can flow
> through one queue?

I think this is more trivial than the other actually.  :)  (For code
changes, I think trivial roughly means "if it compiles fine, it won't
break anything").

For now I applied both patches to my iommu branch.  I'll test it a bit
more tomorrow and then post the IOMMU patches for review.  We should
merge them and the subpage reorg soon in 1.6, since it is (together with
ref/unref) the main serialization point for all the work on BQL-less
dispatch.

BTW, a "trivial" patch would be one that actually defines the term "BQL"
somewhere in the code. :)

Paolo

