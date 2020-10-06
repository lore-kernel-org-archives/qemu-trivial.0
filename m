Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kPnPf-00062z-Vj
	for mharc-qemu-trivial@gnu.org; Tue, 06 Oct 2020 09:53:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kPnPe-00060e-0d
 for qemu-trivial@nongnu.org; Tue, 06 Oct 2020 09:53:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kPnPc-0000hG-Hu
 for qemu-trivial@nongnu.org; Tue, 06 Oct 2020 09:53:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601992431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=CE4rpxQnGmNW4pz1mJB6dVVhMlr06XrIX21AyJ9BQqE=;
 b=NBrv9fDMR30mqv53OwSkmHakqldemhrf4cPp9ZoUYWfaznOHmZ2TxuDdRc/w10ehusCbpx
 sTdObSttJvXM4LDeFT9Pu9tr9pAXwmSFWYMek2B0EJBl2HoOd2yi4Ef+43FWlqAKtVfPCa
 Nr6MLfTMmUXn7mA4UrahQ1Msqk9B8QU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-178-TTu4ZFZsMoGy4bw3MAu-Jg-1; Tue, 06 Oct 2020 09:53:48 -0400
X-MC-Unique: TTu4ZFZsMoGy4bw3MAu-Jg-1
Received: by mail-wr1-f69.google.com with SMTP id t17so2067667wrm.13
 for <qemu-trivial@nongnu.org>; Tue, 06 Oct 2020 06:53:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=CE4rpxQnGmNW4pz1mJB6dVVhMlr06XrIX21AyJ9BQqE=;
 b=E8qm14ZfAbO6/qZUvoek3RuHtdoN7UtNqvMwhNOj+kdZWFL08GihsqLFOfg6BXQp5z
 9RWW+1NbL25MxIdMr+/A94y4AHQPhAJm/gqM19vRs/Oamtubf/peLhF1A0frUtWPu3cg
 BY6DyIo4yt1oJCnWahIcwRQvSYFNiid87QiafuW2S6Ubv5Usq6U3aGXLRkV3Mpk2pMdR
 OEZ8ceK0TCIhIF9dnQ96orxoTfhWDlRiV4LruKKMxJnvlNzULXav0khkQH7Np3/Jl+iM
 M5LFc/7SWcAY3/6C6gTVKN+i20/DwVoayS7SxAWZNQUNVcWdI9STcnzhS9T6RU0B5EcR
 mtKg==
X-Gm-Message-State: AOAM530vmrQj8svKv/FG+vdtM/q2I9JflXKN9c9BrODZmpMA5YZZJeh2
 zUnDKj6TLYTducNLm8nPF2z8DADLZGwYFzKjDB09XTthKzX7Ap2xcMc7S/vS5bwBkawebRXYUxP
 GJnsb9c9XIPFOaidahg==
X-Received: by 2002:a1c:1dc3:: with SMTP id d186mr4749738wmd.182.1601992427188; 
 Tue, 06 Oct 2020 06:53:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw69gxFg73K7DC9Za0dCPPNsMXGoqTh/ezIdflXm9O6hrVvyWkMSkMRmyt2/pIUI5bsIVIfqg==
X-Received: by 2002:a1c:1dc3:: with SMTP id d186mr4749728wmd.182.1601992426984; 
 Tue, 06 Oct 2020 06:53:46 -0700 (PDT)
Received: from [192.168.1.36] (106.red-83-59-162.dynamicip.rima-tde.net.
 [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id 24sm3992857wmg.8.2020.10.06.06.53.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Oct 2020 06:53:46 -0700 (PDT)
Subject: Re: [PATCH] hw/pci: Fix typo in PCI hot-plug error message
To: Julia Suvorova <jusual@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
References: <20201006133958.600932-1-jusual@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <e87cb709-ba14-8973-5815-bf3795b51fa5@redhat.com>
Date: Tue, 6 Oct 2020 15:53:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20201006133958.600932-1-jusual@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/06 01:55:55
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.733,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 06 Oct 2020 13:53:54 -0000

On 10/6/20 3:39 PM, Julia Suvorova wrote:
> 'occupied' is spelled like 'ocuppied' in the message.
> 
> Signed-off-by: Julia Suvorova <jusual@redhat.com>
> ---
>  hw/pci/pci.c       | 2 +-
>  hw/ppc/spapr_pci.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


