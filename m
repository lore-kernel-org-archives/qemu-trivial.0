Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j2ZTz-0004d3-TA
	for mharc-qemu-trivial@gnu.org; Fri, 14 Feb 2020 06:50:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55988)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pmathieu@redhat.com>) id 1j2ZTx-0004a7-7N
 for qemu-trivial@nongnu.org; Fri, 14 Feb 2020 06:50:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pmathieu@redhat.com>) id 1j2ZTw-000521-9h
 for qemu-trivial@nongnu.org; Fri, 14 Feb 2020 06:50:05 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:59345
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pmathieu@redhat.com>) id 1j2ZTw-00051K-69
 for qemu-trivial@nongnu.org; Fri, 14 Feb 2020 06:50:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581681003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iTSDiFosNKc3TrM/zqpo0RpnDn4VdgDCtYGIvt/SkXc=;
 b=hcjstx919HQT+ctYLfNnMLZwAZD0gdUC8sRNfXp8c9cKSrt5NhV9qV/Lypny0TJUkkQjNQ
 HUBP18mjSqSgZ1a1UdpPCx+kbv5PkjRXCC18tw1PCB/xqPW4lLsas5YXsXkfoa5b8hIGYk
 SgGFoVjSfR7HRRgkctMnzc3bRfWM76k=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-t2wePXhCNBan4__YVbOqEQ-1; Fri, 14 Feb 2020 06:50:02 -0500
Received: by mail-wm1-f72.google.com with SMTP id z7so3743729wmi.0
 for <qemu-trivial@nongnu.org>; Fri, 14 Feb 2020 03:50:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iTSDiFosNKc3TrM/zqpo0RpnDn4VdgDCtYGIvt/SkXc=;
 b=YMYj+ykiAIZn/9vpAm3MZJKY/qob8WoSu1FOo+KcoDA2f0GCIJNbTVabOkqwaKC5kd
 eorORhd98iqQur94NYyNi4CVLZzDcphajd1/CzoLkiJJV6iSUNLzolYuGrwTA35Nad/1
 bFTrNSLW0DVJn3bBDrUMhNEQogwYGqRYNyKESm82/yrVhCEC4IotQ9QfJhNDvgBJ9TET
 cwNQg+tkfhgdO1F0Qqpu/Gu6uqSigLdBz34TGbvm0FHYPYH9PH+lLDDY7R3PYfoTDIYF
 0xm9yhBnKd5vpgrg9UUsRjLnsh1qGKvEI7q1bE++Z9VVnt20Xa/cXO+9v8D9x8UzTAXY
 98MQ==
X-Gm-Message-State: APjAAAVLvsk+ZKpbjQOAkwfbin9SHgLLeKmZJB0IkbsdCI895SJTfrWA
 AKA6uOdP48nE5AWMSHoMGt23HlxP9MsZIjuqXxvX9+osZG58NpQDVjCMqo4V0CQ3LiVQaGoAqap
 Yj2AsEyT9d1/5m59Pf2eAgRzRuEYsUO8dww==
X-Received: by 2002:a7b:c459:: with SMTP id l25mr4219917wmi.17.1581681000961; 
 Fri, 14 Feb 2020 03:50:00 -0800 (PST)
X-Google-Smtp-Source: APXvYqyh2hsXtkATST+u0hRluRhlb2NCJ5SvLC5ttby8DPg12nIpmlAs1+jbzUWFXpLgobqD8iUR4yCwG5BPgzcpzFg=
X-Received: by 2002:a7b:c459:: with SMTP id l25mr4219907wmi.17.1581681000737; 
 Fri, 14 Feb 2020 03:50:00 -0800 (PST)
MIME-Version: 1.0
References: <4949c3ecf1a32189b8a4b5eb4b0fd04c1122501d.1581674006.git.mprivozn@redhat.com>
In-Reply-To: <4949c3ecf1a32189b8a4b5eb4b0fd04c1122501d.1581674006.git.mprivozn@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Date: Fri, 14 Feb 2020 12:49:49 +0100
Message-ID: <CAP+75-UqxEE_wDV=1+pNW9cbATry44D=1n-h2ZinUKJ7THYwMQ@mail.gmail.com>
Subject: Re: [PATCH v2] Report stringified errno in VFIO related errors
To: Michal Privoznik <mprivozn@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, 
 Alex Williamson <alex.williamson@redhat.com>
X-MC-Unique: t2wePXhCNBan4__YVbOqEQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
X-List-Received-Date: Fri, 14 Feb 2020 11:50:06 -0000

On Fri, Feb 14, 2020 at 10:56 AM Michal Privoznik <mprivozn@redhat.com> wro=
te:
>
> In a few places we report errno formatted as a negative integer.
> This is not as user friendly as it can be. Use strerror() and/or
> error_setg_errno() instead.
>
> Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
> ---

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>


