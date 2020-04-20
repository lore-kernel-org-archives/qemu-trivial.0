Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jQeZw-0007bf-RK
	for mharc-qemu-trivial@gnu.org; Mon, 20 Apr 2020 18:07:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48506)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ehabkost@redhat.com>) id 1jQeZr-0007Wk-Ig
 for qemu-trivial@nongnu.org; Mon, 20 Apr 2020 18:07:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <ehabkost@redhat.com>) id 1jQeZr-0006X5-4n
 for qemu-trivial@nongnu.org; Mon, 20 Apr 2020 18:07:43 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:33284
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1jQeZq-0006VE-Mh
 for qemu-trivial@nongnu.org; Mon, 20 Apr 2020 18:07:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587420461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Eba6AAaAwPQna7twZ39GzRHBpJVsFHAoPc+eW4Ra8vs=;
 b=LVswOyMsrfUu5jfbqaLMCdIMF/NtDL+2yX2kV15ol/EEzQJYUIrCNlTazSd2KJNQoxYPvc
 EokBv/lon5x+svJn+93ROlygRM/u/L7FI8FZXbzI4GMwBBwtqV+fs5x6K7QNXQ/NELCpvp
 gkeSOdEykV0sTgC2yyXsdmR3scoTEbM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-q36TAyMaPvaLL3C0-4alvg-1; Mon, 20 Apr 2020 18:07:37 -0400
X-MC-Unique: q36TAyMaPvaLL3C0-4alvg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DFBE21005509;
 Mon, 20 Apr 2020 22:07:35 +0000 (UTC)
Received: from localhost (ovpn-112-218.phx2.redhat.com [10.3.112.218])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 151A560C80;
 Mon, 20 Apr 2020 22:07:34 +0000 (UTC)
Date: Mon, 20 Apr 2020 18:07:33 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 peter.maydell@linaro.org, Wenchao Wang <wenchao.wang@intel.com>,
 Colin Xu <colin.xu@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>,
 "open list:X86 HAXM CPUs" <haxm-team@intel.com>
Subject: Re: [PATCH 1/2] hax: Fix setting of FD_CLOEXEC
Message-ID: <20200420220733.GH4952@habkost.net>
References: <20200420175309.75894-1-eblake@redhat.com>
 <20200420175309.75894-2-eblake@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200420175309.75894-2-eblake@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/20 18:07:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
X-List-Received-Date: Mon, 20 Apr 2020 22:07:47 -0000

On Mon, Apr 20, 2020 at 12:53:07PM -0500, Eric Blake wrote:
> Blindly setting FD_CLOEXEC without a read-modify-write will
> inadvertently clear any other intentionally-set bits, such as a
> proposed new bit for designating a fd that must behave in 32-bit mode.
> Use our wrapper function instead of an incorrect hand-rolled version.
>=20
> Signed-off-by: Eric Blake <eblake@redhat.com>

Thanks, queued for 5.1.

--=20
Eduardo


