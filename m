Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ipAfA-0000ih-0T
	for mharc-qemu-trivial@gnu.org; Wed, 08 Jan 2020 07:42:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36330)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1ipAf6-0000cC-P3
 for qemu-trivial@nongnu.org; Wed, 08 Jan 2020 07:42:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1ipAf4-0001cd-On
 for qemu-trivial@nongnu.org; Wed, 08 Jan 2020 07:42:12 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:32374
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1ipAf4-0001bg-LX
 for qemu-trivial@nongnu.org; Wed, 08 Jan 2020 07:42:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578487329;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WAa+NU+TVGTARtvdxInfQ1J7oakd2iiBzZPC9U7vFEU=;
 b=N0GEzzvv0SzjAAqcf8PYwXFwN6t1oRU7obtYDbh4SGpz9Hhv7x14m5A39PPImdqyi436bt
 1pAkzkfRIM9rTz00eYqKSMPyf7Ya64CE4IoRLBNiKu+Ysmnuki4yEv5gTGFgU8Ea8L3dd2
 fOb3HV/qAbAhMnO8zfuBWx/GliS1BJ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-nGX2UtpINdGi9QRO0b9UfA-1; Wed, 08 Jan 2020 07:42:05 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B1DF2DB20;
 Wed,  8 Jan 2020 12:42:04 +0000 (UTC)
Received: from redhat.com (unknown [10.36.118.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 01FF11001B08;
 Wed,  8 Jan 2020 12:42:03 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v1 05/59] ram.c: remove unneeded labels
In-Reply-To: <20200106182425.20312-6-danielhb413@gmail.com> (Daniel Henrique
 Barboza's message of "Mon, 6 Jan 2020 15:23:31 -0300")
References: <20200106182425.20312-1-danielhb413@gmail.com>
 <20200106182425.20312-6-danielhb413@gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
Reply-To: quintela@redhat.com
Date: Wed, 08 Jan 2020 13:41:59 +0100
Message-ID: <877e22i0h4.fsf@secure.laptop>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: nGX2UtpINdGi9QRO0b9UfA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Wed, 08 Jan 2020 12:42:14 -0000

Daniel Henrique Barboza <danielhb413@gmail.com> wrote:
> ram_save_queue_pages() has an 'err' label that can be replaced by
> 'return -1' instead.
>
> Same thing with ram_discard_range(), and in this case we can also
> get rid of the 'ret' variable and return either '-1' on error
> or the result of ram_block_discard_range().
>
> CC: Juan Quintela <quintela@redhat.com>
> CC: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

queued


