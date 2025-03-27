Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1txi43-0002Ex-R4
	for mharc-qemu-trivial@gnu.org; Thu, 27 Mar 2025 03:54:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1txi41-0002Ci-0k
 for qemu-trivial@nongnu.org; Thu, 27 Mar 2025 03:54:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1txi3y-0003oD-UN
 for qemu-trivial@nongnu.org; Thu, 27 Mar 2025 03:54:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743062045;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ccc35QADEGehROxcQiqbD+Bb+GamooMNcnrOOUIT/6o=;
 b=g+MwCzS3FCVzagqmcrQmpjlGMhg1TWHlaJ/VHv9P4etkAMNkAVxAPGqCMnnpcBivaXnusJ
 2JRY0yhEazZJkxO0N/wiwmK26LNYjzTEkOSgTWgNvA6+qkoqjIFKjCUZvZqbj7uEn4hk/c
 xsXQbV4apRJkbGUfswxIaLiSinP+UBQ=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-325-in2EsQm8MxWunQ0ltV-k7g-1; Thu,
 27 Mar 2025 03:54:01 -0400
X-MC-Unique: in2EsQm8MxWunQ0ltV-k7g-1
X-Mimecast-MFC-AGG-ID: in2EsQm8MxWunQ0ltV-k7g_1743062039
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 09ED7180025C; Thu, 27 Mar 2025 07:53:58 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.22.74.4])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 591A51956095; Thu, 27 Mar 2025 07:53:54 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8CCF621E66C5; Thu, 27 Mar 2025 08:53:51 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,  Peter Xu <peterx@redhat.com>,  "Gonglei
 (Arei)" <arei.gonglei@huawei.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,  Paolo Bonzini <pbonzini@redhat.com>,  Daniel P.
 =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Ani Sinha
 <anisinha@redhat.com>,  Michael
 Tokarev <mjt@tls.msk.ru>,  Lukas Straub <lukasstraub2@web.de>,  Fabiano
 Rosas <farosas@suse.de>,  Eduardo Habkost <eduardo@habkost.net>,  Stefan
 Berger <stefanb@linux.vnet.ibm.com>,  qemu-trivial@nongnu.org,  Jason Wang
 <jasowang@redhat.com>,  Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,  Peter Maydell
 <peter.maydell@linaro.org>,  Laurent Vivier <laurent@vivier.eu>,  Yanan
 Wang <wangyanan55@huawei.com>,  Zhao Liu <zhao1.liu@intel.com>,  Stefan
 Hajnoczi <stefanha@redhat.com>,  Kevin Wolf <kwolf@redhat.com>,  "Michael
 S. Tsirkin" <mst@redhat.com>,  qemu-block@nongnu.org,  Zhenwei Pi
 <pizhenwei@bytedance.com>,  Mads Ynddal <mads@ynddal.dk>,  Gerd Hoffmann
 <kraxel@redhat.com>,  Michael Roth <michael.roth@amd.com>,  Eric Blake
 <eblake@redhat.com>,  Jiri Pirko <jiri@resnulli.us>
Subject: Re: [PATCH 2/4] docs, qapi: generate undocumented return sections
In-Reply-To: <CAFn=p-ZrR+xxfKGSEBusGgwbXOha7_FM_bhrtTN+HM2OKN6Vig@mail.gmail.com>
 (John Snow's message of "Wed, 26 Mar 2025 12:30:56 -0400")
References: <20250322010857.309490-1-jsnow@redhat.com>
 <20250322010857.309490-3-jsnow@redhat.com>
 <87cye5mopz.fsf@pond.sub.org>
 <CAFn=p-ZDmOTDWie6tCKyOGFj3R4wm9N_4r+J9VWzGYKKoF7sbw@mail.gmail.com>
 <CAFn=p-ZrR+xxfKGSEBusGgwbXOha7_FM_bhrtTN+HM2OKN6Vig@mail.gmail.com>
Date: Thu, 27 Mar 2025 08:53:51 +0100
Message-ID: <87h63e29kg.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 27 Mar 2025 07:54:10 -0000

John Snow <jsnow@redhat.com> writes:

> With the insertions fixed to not duplicate/triplicate things, I notice
> these (unintentional) changes:
>
> - x-debug-block-dirty-bitmap-sha256 moves returns from above errors to below
> - blockdev-snapshot-delete-internal-sync ditto
> - query-xen-replication-status ditto
> - query-colo-status ditto
> - query-balloon ditto
> - query-hv-balloon-status-report ditto
> - query-yank -- this one actually moves it from above what would be details
> to below -- this creates a new ambiguous case as we discussed on call
> earlier today.
> - add-fd goes from above errors to below errors again.

ACK.  Let's discuss this in review of v2.

[...]


