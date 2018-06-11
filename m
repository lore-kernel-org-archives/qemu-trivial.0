Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fSPQI-0004Mg-2R
	for mharc-qemu-trivial@gnu.org; Mon, 11 Jun 2018 12:12:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57133)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fSPQE-0004Jl-OY
	for qemu-trivial@nongnu.org; Mon, 11 Jun 2018 12:12:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fSPQD-0008W2-PZ
	for qemu-trivial@nongnu.org; Mon, 11 Jun 2018 12:11:58 -0400
Received: from mail-ot0-x244.google.com ([2607:f8b0:4003:c0f::244]:45850)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fSPQD-0008VN-Iz
	for qemu-trivial@nongnu.org; Mon, 11 Jun 2018 12:11:57 -0400
Received: by mail-ot0-x244.google.com with SMTP id a5-v6so24412364otf.12
	for <qemu-trivial@nongnu.org>; Mon, 11 Jun 2018 09:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=2DATyebT9pFoi4yt5EORReo3xEgPtNvbuS+o2CySh5o=;
	b=SA2+0iFhIkf72kZNG5oxQngJ5sxUM7P64koHgNJVpClWO38u4hsjAVEy4Q6rpa/Ii4
	YvGvFpJRD7rI/RaOFT8nMCT4xhNbJnsvndHjd8tF3j+ZviJBsTELaT7qocDlRWvyfnpv
	iZeyLtf31C3tKxEmvtqwWJnzhepQLctcekxNw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=2DATyebT9pFoi4yt5EORReo3xEgPtNvbuS+o2CySh5o=;
	b=NYLLSHLrOgMQ2pRTSYiizAAUSKzPEgy1rH3xIROz/zf63fkPxXdsrq4qGgYPykBLZw
	6n1VwIpF0RyQV39MUuerjbt3v6NB7ybenumUon/paL99hY9e1AeK7C/Gs9RWcrw7hiCs
	oGbNxfrxg5drgPDiH+6WoByUinw/5qJ4vP1JxwY9pLsK6P+x8l7e35rrkTXpVic1c5Ck
	RdSCjHL/2OjV8ia93CYh4dCc6N7k1xVYy/8cS8CkjmEsgUgGuk6Z279zTFkAEMV7Wij6
	l7u57sJAdP/bUWEfoGnCO0vsstwHBjY4csUSLNRQGNGtGEBHfXscVPUFbGkfCEtjLQBS
	cmyQ==
X-Gm-Message-State: APt69E13n6kg/kZKTlUx5NNtDRmnqWTVdoyVJirJF6fR8f0Nr7Ky8NI4
	lJSdvSyytV0d8vS3sRJdbAcbezJo76bfPfPI58lomA==
X-Google-Smtp-Source: ADUXVKJhiDKHndc/sOAXCy5mYnHZ5oldvWyiopCwW2vc8c12ds/wk3tdlVWn8jx3d7O3b4HiKF7mGc6+fDnZ5LoVBks=
X-Received: by 2002:a9d:3fda:: with SMTP id
	i26-v6mr9651602ote.126.1528733516768; 
	Mon, 11 Jun 2018 09:11:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Mon, 11 Jun 2018 09:11:36
	-0700 (PDT)
In-Reply-To: <54eb6ae9-d7e0-8a4d-6bd4-f8f1d0f00b92@redhat.com>
References: <20180611011501.10235-1-f4bug@amsat.org>
	<54eb6ae9-d7e0-8a4d-6bd4-f8f1d0f00b92@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Jun 2018 17:11:36 +0100
Message-ID: <CAFEAcA_ePZZ6TCAyxyoBJtiYYOqY13H+U_Vau_+z9D6on9iaoA@mail.gmail.com>
To: Eric Blake <eblake@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
	Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>, 
	Nikunj A Dadhania <nikunj@linux.vnet.ibm.com>,
	qemu-arm <qemu-arm@nongnu.org>, Qemu-block <qemu-block@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>, 
	qemu-ppc <qemu-ppc@nongnu.org>, qemu-s390x <qemu-s390x@nongnu.org>, 
	QEMU Trivial <qemu-trivial@nongnu.org>,
	Fabien Chouteau <chouteau@adacore.com>, 
	Alistair Francis <alistair@alistair23.me>,
	Aurelien Jarno <aurelien@aurel32.net>, 
	Anthony Perard <anthony.perard@citrix.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>, 
	Marek Vasut <marex@denx.de>, Sagar Karandikar <sagark@eecs.berkeley.edu>,
	David Gibson <david@gibson.dropbear.id.au>,
	Antony Pavlov <antonynpavlov@gmail.com>, 
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Andrzej Zaborowski <balrogg@gmail.com>, 
	Beniamino Galvani <b.galvani@gmail.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, 
	Chris Wulff <crwulff@gmail.com>,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>, 
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>, 
	Max Filippov <jcmvbkbc@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>, 
	Alberto Garcia <berto@igalia.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
	Keith Busch <keith.busch@intel.com>,
	Stefano Stabellini <sstabellini@kernel.org>, 
	Stefan Berger <stefanb@linux.vnet.ibm.com>, 
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Paul Burton <paul.burton@mips.com>, Yongbok Kim <yongbok.kim@mips.com>,
	Peter Chubb <peter.chubb@nicta.com.au>, 
	Yuval Shaia <yuval.shaia@oracle.com>,
	=?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>, 
	Alex Williamson <alex.williamson@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, 
	Cornelia Huck <cohuck@redhat.com>, David Hildenbrand <david@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Fam Zheng <famz@redhat.com>, 
	Igor Mammedov <imammedo@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Gerd Hoffmann <kraxel@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
	Max Reitz <mreitz@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Michael Clark <mjc@sifive.com>, 
	Palmer Dabbelt <palmer@sifive.com>, Jiri Slaby <jslaby@suse.cz>,
	Alexander Graf <agraf@suse.de>, 
	Richard Henderson <rth@twiddle.net>, Michael Walle <michael@walle.cc>,
	Jan Kiszka <jan.kiszka@web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::244
Subject: Re: [Qemu-trivial] [PATCH v4 00/40] Use the IEC binary prefix
 definitions
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
X-List-Received-Date: Mon, 11 Jun 2018 16:12:00 -0000

On 11 June 2018 at 16:55, Eric Blake <eblake@redhat.com> wrote:
> On 06/10/2018 08:14 PM, Philippe Mathieu-Daud=C3=A9 wrote:
>>
>> Hi,
>>
>> This series:
>>
>> - split the byte-based definitions from "qemu/cutils.h" to "qemu/units.h=
"
>>    (this now triggers WARNING: 1 added file, does MAINTAINERS need
>> updating?)
>> - clean hw/ includes;
>> - replace different constants used for byte size with their correspondin=
g
>>    IEC binary prefix definitions.
>>
>> Since v3:
>> - use IEC binary prefix definitions (Stefan Weil)
>> - rebased
>> - added R-b tags
>>
>
>>   hw/net/ne2000.h                          |  5 ++--
>
> ...
>>
>>   tests/test-qemu-opts.c                   |  7 +++---
>>   scripts/checkpatch.pl                    |  1 +
>>   135 files changed, 533 insertions(+), 431 deletions(-)
>>   create mode 100644 include/qemu/units.h
>>
>
> At least monitor.c and vl.c are missing from this list; a more general gr=
ep
> shows that the following are all potential candidates for this cleanup:

This patchset is already 40 patches long, though; if we like it
then we should just go ahead with it and deal with the stragglers
in a second series.

thanks
-- PMM

