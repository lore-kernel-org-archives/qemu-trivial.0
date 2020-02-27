Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j7NTT-0004cv-PM
	for mharc-qemu-trivial@gnu.org; Thu, 27 Feb 2020 13:01:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58264)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1j7NTQ-0004a3-Mv
 for qemu-trivial@nongnu.org; Thu, 27 Feb 2020 13:01:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1j7NTP-000850-OC
 for qemu-trivial@nongnu.org; Thu, 27 Feb 2020 13:01:24 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:59498
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1j7NTP-00084n-Jd
 for qemu-trivial@nongnu.org; Thu, 27 Feb 2020 13:01:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582826481;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T+j4bN2/WJq3hO1MZI46vBrLWn7Bby6PVvgTHbIvagg=;
 b=ROAvDDGzC9BXdvAT70ta1ReEbsrZJuetU4OdcTyZ+AubbOBcQKh8N1eKBv0Y9IHsZbocX9
 2reCNUVO4iyKihCGQIrfVB/r/uZhSMUjEI1lUlEgiUANUrkL4Tu+NlhyKJ6aP+uMAiqCp6
 wd8lLkfnjQOSmuvvX7YJKrd9imFiRlM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-97-UjH9S1zhNYG8PhRUbQ3lQw-1; Thu, 27 Feb 2020 13:01:17 -0500
X-MC-Unique: UjH9S1zhNYG8PhRUbQ3lQw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 30C1F18B5F71;
 Thu, 27 Feb 2020 18:01:16 +0000 (UTC)
Received: from redhat.com (ovpn-116-72.ams2.redhat.com [10.36.116.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 70C8E19C69;
 Thu, 27 Feb 2020 18:01:12 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: <kuhn.chenqun@huawei.com>
Cc: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>,
 <peter.maydell@linaro.org>, <zhang.zhanghailiang@huawei.com>,
 Euler Robot <euler.robot@huawei.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v2 10/13] migration/vmstate: Remove redundant statement in
 vmstate_save_state_v()
In-Reply-To: <20200226084647.20636-11-kuhn.chenqun@huawei.com> (kuhn chenqun's
 message of "Wed, 26 Feb 2020 16:46:44 +0800")
References: <20200226084647.20636-1-kuhn.chenqun@huawei.com>
 <20200226084647.20636-11-kuhn.chenqun@huawei.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
Reply-To: quintela@redhat.com
Date: Thu, 27 Feb 2020 19:01:08 +0100
Message-ID: <87o8tjdi57.fsf@secure.laptop>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
X-List-Received-Date: Thu, 27 Feb 2020 18:01:25 -0000

<kuhn.chenqun@huawei.com> wrote:
> From: Chen Qun <kuhn.chenqun@huawei.com>
>
> The "ret" has been assigned in all branches. It didn't need to be
>  assigned separately.
>
> Clang static code analyzer show warning:
>   migration/vmstate.c:365:17: warning: Value stored to 'ret' is never rea=
d
>                 ret =3D 0;
>                 ^     ~
>
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>

I thought I had already reviewed it.

Reviewed-by: Juan Quintela <quintela@redhat.com>
queued


