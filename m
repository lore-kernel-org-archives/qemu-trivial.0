Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p01ZQ-0001mi-Qv
	for mharc-qemu-trivial@gnu.org; Tue, 29 Nov 2022 09:26:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1p01ZP-0001mO-Ai
 for qemu-trivial@nongnu.org; Tue, 29 Nov 2022 09:26:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1p01ZM-0007Bn-Pj
 for qemu-trivial@nongnu.org; Tue, 29 Nov 2022 09:26:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669732003;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=D2OcN7PUq9hrhaiyG0cx6xSaET92khQ5Qnqsu4ELxMc=;
 b=cU8XUE2vzRyTWjMF0QiIVraPAbktRm8/ukmSktO95Uxcan2D1jQpTEn1j/fL7m0JrhEipJ
 nKlf044uXS8FQSf3EORxVETgzUsRAYYh0G4gfjorE9FGcB4fVha9ETMgVIEFlh1lwwYVKG
 QFtJSVdcrxSx+qyI7MMXk5vYdK1ufAk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-60-GNe-3xedMTWnkgSuVMj8aA-1; Tue, 29 Nov 2022 09:26:39 -0500
X-MC-Unique: GNe-3xedMTWnkgSuVMj8aA-1
Received: by mail-wr1-f72.google.com with SMTP id
 k7-20020adfc707000000b002416f2e9ad5so2853934wrg.6
 for <qemu-trivial@nongnu.org>; Tue, 29 Nov 2022 06:26:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D2OcN7PUq9hrhaiyG0cx6xSaET92khQ5Qnqsu4ELxMc=;
 b=MugdNte0IX6nCA2EjqTufpyVQ3uI0k83Mfh5p7rgatGElAAq/h40m4VQQIMtceFQot
 18Q4mG3eV6VG18k7SloG0bAHDsfTHwpS6ITZzAjt1krtAwgZWeQ4ED69DIYInkpm+fty
 diHRrCjFNLikWc8rHWg0KbGS+iYqGFbtaIQGfWA4NTsuWgButjMZsi3cdra1ZTI3+dAf
 U+41AOBeBwALwisi6oHY/OeQLjyAVWwBD2BIoNF2/Vd+g5jiuEr5x3en2EX0lYf/Yv2r
 iYbl7pfwlk4gfkfTuGvbSB8/l/zqEmDbAMurw9aDioZX08q/IryLXPEwgnJkHrDxcOFi
 97tg==
X-Gm-Message-State: ANoB5pkiTZUAwtC8y3oAXKPG6+iTCyD40hbPlS2npO8tanX9pSaHEzRr
 wQVtihLSD9DR1kA/1AonxbOx8dXX4dQU03IW5GR4kHzumsgqZucmIYWdNueucDuLmpn52wMAK1v
 YrpR9ef5YdtQM+R57pQ==
X-Received: by 2002:a05:6000:691:b0:241:b92b:d086 with SMTP id
 bo17-20020a056000069100b00241b92bd086mr35418017wrb.259.1669731998716; 
 Tue, 29 Nov 2022 06:26:38 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6kmpYUN3qnHrjevIDEaTxDQG0zIiY6I+WMZI2rOPxQ+6o/gtc5cpPQ45349ss9Al3m8AQCbA==
X-Received: by 2002:a05:6000:691:b0:241:b92b:d086 with SMTP id
 bo17-20020a056000069100b00241b92bd086mr35418005wrb.259.1669731998493; 
 Tue, 29 Nov 2022 06:26:38 -0800 (PST)
Received: from localhost ([31.4.242.201]) by smtp.gmail.com with ESMTPSA id
 n3-20020a1ca403000000b003d005aab31asm2057070wme.40.2022.11.29.06.26.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Nov 2022 06:26:37 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Stefan Weil via <qemu-devel@nongnu.org>
Cc: qemu-trivial@nongnu.org,  Stefan Weil <sw@weilnetz.de>,  David Alan
 Gilbert <dgilbert@redhat.com>,  Thomas Huth <thuth@redhat.com>,  Laurent
 Vivier <lvivier@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH for-7.2] tests/qtest: Fix two format strings
In-Reply-To: <20221105115525.623059-1-sw@weilnetz.de> (Stefan Weil via's
 message of "Sat, 5 Nov 2022 12:55:25 +0100")
References: <20221105115525.623059-1-sw@weilnetz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
Reply-To: quintela@redhat.com
Date: Tue, 29 Nov 2022 15:26:36 +0100
Message-ID: <87r0xlltur.fsf@secure.mitica>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Nov 2022 14:26:47 -0000

Stefan Weil via <qemu-devel@nongnu.org> wrote:
> Signed-off-by: Stefan Weil <sw@weilnetz.de>

Reviewed-by: Juan Quintela <quintela@redhat.com>
queued


