Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kwMEB-0008Bg-5B
	for mharc-qemu-trivial@gnu.org; Mon, 04 Jan 2021 04:32:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kwME9-00088O-Ff
 for qemu-trivial@nongnu.org; Mon, 04 Jan 2021 04:32:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kwME7-0000dw-BM
 for qemu-trivial@nongnu.org; Mon, 04 Jan 2021 04:32:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609752754;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HxTr71QZaT90y8c2vL2GVs5Sp2A5X0ewvCwxjpolVVQ=;
 b=eFegN5DYxlwHQjgzb7T49vdg0kqgCEz9jHfaDmqPsteRZ905ITtsloFDLW1Std8gl/Q8L8
 vspS7JdfxRoGZZY0eaD/Gs2m0fuOO4rEUlKnM1rNnQnFUnaCgE5nyqMqzvfqU49a85lRtX
 SoTZYKlQYIWr0o6uLmJcKWZKpc0WLC8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-mmTu-8bBPLeo2DUFtjWg5Q-1; Mon, 04 Jan 2021 04:32:31 -0500
X-MC-Unique: mmTu-8bBPLeo2DUFtjWg5Q-1
Received: by mail-wr1-f71.google.com with SMTP id o17so13025044wra.8
 for <qemu-trivial@nongnu.org>; Mon, 04 Jan 2021 01:32:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=tn7hDzxpKrM1swuwnw3aSgEMZIORK6hhOk9QF/UxR54=;
 b=Y3KJBytZrTLv40isWUF1EkhugbY0IqjxMx35v5RCJ/whaNFxu7bH0ZfoI6PZ4dDwiO
 LYq0K5njjybbJbFgpLGkDhJDxUdHX5Wh+joy9mz8xxT3oVa+RCS8ERhKRFEqepnt1mh1
 EviJyOEkXBEIs92K/qLDZQ5EqJky5X/xl8xs7PAK+uicUBuu1Ny2fps4azq+ohfhvTGK
 dn39vu1/5D4dK+G4Riismg0BprU7oMp3pXjA4vJ07SHTjHrBlkBIswBFWfGddQy9UVKo
 hpEdgarZSPfxxNO3Q1V5aMMdkiqaunGBa32stf1Lbed26tG/RgFeSuEgp1c7z/NskG26
 8J1Q==
X-Gm-Message-State: AOAM531rdzycGl12QtU5Rkfmv2T97wMGdI+cBBPYGYQ1klMTkNEV+EsU
 ECN46gUWkmciSut0284hxS18FpYZe+glZf9Dc3qrDgCK5XiprTkNdG1BHl/rGJAcCVaHEoENbfH
 8ah/Hof5dAM/wcG2A6w==
X-Received: by 2002:a05:6000:10c4:: with SMTP id
 b4mr80539872wrx.170.1609752750022; 
 Mon, 04 Jan 2021 01:32:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx4JuLN6jtROkA0DcLhevcSrtv/oKG8Fo13+2fbLpVuH3BNDwBHHvd1SgSdxKPaKWu9HdWnpw==
X-Received: by 2002:a05:6000:10c4:: with SMTP id
 b4mr80539832wrx.170.1609752749696; 
 Mon, 04 Jan 2021 01:32:29 -0800 (PST)
Received: from redhat.com (bzq-79-178-32-166.red.bezeqint.net. [79.178.32.166])
 by smtp.gmail.com with ESMTPSA id n9sm88912868wrq.41.2021.01.04.01.32.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jan 2021 01:32:28 -0800 (PST)
Date: Mon, 4 Jan 2021 04:32:25 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-ppc@nongnu.org, qemu-trivial@nongnu.org,
 Paul Durrant <paul@xen.org>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-arm@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Stefano Stabellini <sstabellini@kernel.org>, Helge Deller <deller@gmx.de>,
 Anthony Perard <anthony.perard@citrix.com>,
 Richard Henderson <rth@twiddle.net>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 xen-devel@lists.xenproject.org,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Paolo Bonzini <pbonzini@redhat.com>, Huacai Chen <chenhc@lemote.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 0/5] hw: Use PCI macros from 'hw/pci/pci.h'
Message-ID: <20210104043218-mutt-send-email-mst@kernel.org>
References: <20201012124506.3406909-1-philmd@redhat.com>
 <04b12adf-39ad-dc19-0458-74b0db809a95@amsat.org>
MIME-Version: 1.0
In-Reply-To: <04b12adf-39ad-dc19-0458-74b0db809a95@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Mon, 04 Jan 2021 09:32:37 -0000

On Sun, Jan 03, 2021 at 02:04:53PM +0100, Philippe Mathieu-Daudé wrote:
> On 10/12/20 2:45 PM, Philippe Mathieu-Daudé wrote:
> > Trivial patches using the generic PCI macros from "hw/pci/pci.h".
> > 
> > Philippe Mathieu-Daudé (5):
> >   hw/pci-host/bonito: Make PCI_ADDR() macro more readable
> >   hw/pci-host: Use the PCI_BUILD_BDF() macro from 'hw/pci/pci.h'
> >   hw/pci-host/uninorth: Use the PCI_FUNC() macro from 'hw/pci/pci.h'
> >   hw: Use the PCI_SLOT() macro from 'hw/pci/pci.h'
> >   hw: Use the PCI_DEVFN() macro from 'hw/pci/pci.h'
> 
> As this series are trivial and Acked, I'm going to queue
> it via the mips-tree, as other reviewed patches depend
> on it.
> 
> Thanks,
> 
> Phil.

Fine.
Acked-by: Michael S. Tsirkin <mst@redhat.com>


