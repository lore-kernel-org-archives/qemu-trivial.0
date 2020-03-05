Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j9nxE-0000UB-Gj
	for mharc-qemu-trivial@gnu.org; Thu, 05 Mar 2020 05:42:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48659)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <sgarzare@redhat.com>) id 1j9nx8-0000Mm-2L
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 05:42:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <sgarzare@redhat.com>) id 1j9nx6-0005Vy-8b
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 05:42:05 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:41521
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <sgarzare@redhat.com>) id 1j9nx6-0005Us-5D
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 05:42:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583404923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cZzhPs4lKOub7hqjBkp9uPQ2s+BWc0jPInjvGy7kMvU=;
 b=FwyR5X3vG/sh5V0vJrkaXcHSIuK+ZGLOXFq2CQqveGm9pUi/qgXk30y4D/+4QxzQIGp1P0
 i494/7kJIHoOrez09HHgMEnUSIuuWLEaD2Z2jyz+DFK/th9GNxeOhJ4Sp57CzJjkRtr+Ws
 iKmXPQwpJgZfitNRJPn30TepsDwfjLk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-89-ZVA1hR_gPSeVxcL7ejBonA-1; Thu, 05 Mar 2020 05:41:59 -0500
X-MC-Unique: ZVA1hR_gPSeVxcL7ejBonA-1
Received: by mail-wm1-f69.google.com with SMTP id c5so1915078wmd.8
 for <qemu-trivial@nongnu.org>; Thu, 05 Mar 2020 02:41:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=urP5OrHUBAsubdAZ/Xc/6u78BkkUpUvVqF1sL38Vk2Y=;
 b=LlOX0HBrDfVEqQG+bXILlY9JGl+zWUtQlXKbbDIZauCC5DYY5j/iDEU0f6WjzHSxtg
 IVDCcV+2GbIKp6DF0MkiNiaFWJeZ8/0UnbQp3iy9pOB5ZbAm9XrnP0efw2/nmdi2CLYE
 p+SX+evrs/Dbc/KZSo9gWLGcZNRVY6HMQdoyJsgdHn38fB/twtEi6aSocKVC7KZ2hfhm
 we0/D6ntSGL9wKOzncvs/HY+rX4CYksZTbGSN9Yql7Jd+SmeoUCNcNVZGKfoXHhNIlty
 cAiYXBeT1ifYplhwTWb8DVuXTx1R5IGa2Wd4JjPty2IeSBpIAwuEFpy28c/N57SOZ3N5
 mUYA==
X-Gm-Message-State: ANhLgQ0b2xyVFFvmQ8z4/3dyv4iM3/WH5BIGcxKn2a64v2X6WOLRxGhG
 EZkSTEQjLRzMt8rKeH2FwP000h8iqSxr2n02yK6/XoY614Vg4gs0mF9bd3BTAv9aSSBRfTXhENy
 ZodhnQ9B4Mhe55ZiXsg==
X-Received: by 2002:adf:a505:: with SMTP id i5mr8798134wrb.33.1583404917972;
 Thu, 05 Mar 2020 02:41:57 -0800 (PST)
X-Google-Smtp-Source: ADFU+vv/KpEUkOs/jPTy1SwcyYCkwoXHZuXGXCqUvPRjV0Qx1ZizHcz2X36XN+K34JYiTil1YZw/sA==
X-Received: by 2002:adf:a505:: with SMTP id i5mr8798111wrb.33.1583404917763;
 Thu, 05 Mar 2020 02:41:57 -0800 (PST)
Received: from steredhat (host34-204-dynamic.43-79-r.retail.telecomitalia.it.
 [79.43.204.34])
 by smtp.gmail.com with ESMTPSA id p16sm43870161wrw.15.2020.03.05.02.41.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 02:41:57 -0800 (PST)
Date: Thu, 5 Mar 2020 11:41:42 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 qemu-trivial@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Greg Kurz <groug@kaod.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 0/3] hw/net,virtfs-proxy-helper: Reduce .data footprint
Message-ID: <20200305104142.t4f2jf32y2lms3sd@steredhat>
References: <20200305010446.17029-1-philmd@redhat.com>
 <20200305095357.nvhjz7q7tuquys4k@steredhat>
 <8488759c-022a-1c74-c9a1-ad223959494b@redhat.com>
MIME-Version: 1.0
In-Reply-To: <8488759c-022a-1c74-c9a1-ad223959494b@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
X-List-Received-Date: Thu, 05 Mar 2020 10:42:08 -0000

On Thu, Mar 05, 2020 at 11:37:22AM +0100, Philippe Mathieu-Daud=E9 wrote:
> On 3/5/20 10:53 AM, Stefano Garzarella wrote:
> > On Thu, Mar 05, 2020 at 02:04:43AM +0100, Philippe Mathieu-Daud=E9 wrot=
e:
> > > More memory footprint reduction, similar to:
> > > https://lists.gnu.org/archive/html/qemu-devel/2020-03/msg00984.html
> > >=20
> > > The elf-dissector tool [1] [2] helped to notice the big array.
> > >=20
> > > [1] https://phabricator.kde.org/source/elf-dissector/
> > > [2] https://www.volkerkrause.eu/2019/06/22/elf-dissector-aarch64-supp=
ort.html
> > >=20
> >=20
> > Thanks to share these links!
>=20
> FYI the heap equivalent (besides that more powerful) is:
> https://github.com/KDE/heaptrack

Cool, thanks!

Previously I used valgrind's massif tool to track the heap, but I'll try
heaptrack.

Cheers,
Stefano


