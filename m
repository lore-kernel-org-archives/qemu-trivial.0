Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kX8GK-0003cv-HP
	for mharc-qemu-trivial@gnu.org; Mon, 26 Oct 2020 15:34:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1kX8GI-0003Wx-6p; Mon, 26 Oct 2020 15:34:34 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:41305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1kX8GG-00025N-D3; Mon, 26 Oct 2020 15:34:33 -0400
Received: from [192.168.100.1] ([82.252.139.38]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N8X9L-1kJqc70gLp-014PPu; Mon, 26 Oct 2020 20:34:26 +0100
Subject: Re: [PATCH 1/4] qdev: Fix two typos
To: Thomas Huth <thuth@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 QEMU Trivial <qemu-trivial@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20201019163702.471239-1-mlevitsk@redhat.com>
 <20201019163702.471239-2-mlevitsk@redhat.com>
 <ce809c9e-c6ad-2d4b-a186-d32ab79213ef@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <03a9894b-c6c3-8d1b-ff60-10bb17bf2dfc@vivier.eu>
Date: Mon, 26 Oct 2020 20:34:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <ce809c9e-c6ad-2d4b-a186-d32ab79213ef@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:dZ/zpS+44wCAZ782kZblDXIYj9sLMDZRDFoO7X/4P7iLeABrfP/
 ynEX3P5vQGaKNc4O+Z/2RYlOiAekwxDV0JieBw66QYq+OxQhvZepp1IvHLRdw9p2EO9SviH
 j499VyoG6njJg/B3zacisyi8s3QcZhweO12Tk6dHRVs0Cg3BUzV4hQrJq0qJ2k7scyOj9zE
 0MaVc3nchfZogn7/ubxoQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:bz7q21iirus=:8Ugv2UsJfpJvlpjS6LUz3N
 M7/GP/1v9PQJ4NQhUQxI2YrggMcboWX+ZDojNlm/E1V7wTzumO68TfZx//PYzj/d6XkVCej7B
 CjQf/fP1WxrN1F+8AmET+S3GO1zKnrV23sSnglX5uEq1fE9O+EK2Vt0pILQQkq1trzkKfOW+w
 31cPnDw4aVMsdivrR8Cfr4oTx6BR0XWWFwzZmmsJ++v3C2eVbmjXEKwg3pQvejnmHXS2XZUmH
 3ViU9SrnOiQm7ZlFNE1AHDzIOcQIEaKcBVeXR1J80EoVkconQ5GCwxaAMuI2i5O0JxOeksG30
 K9g054qLDlIHQiHUFJMofISbw9qgPLXA5HHuBe/V0BPGSuGPnFcLXZRR9r8DrJmD/ol0fWCjy
 zn4inzyQgF3huNsj+gwlpnqrkr2kn1lnKKthuEOx9UMDNZc/sGbuC17xKLC0U2MHfAT+R1dcH
 6gbc+/n42g==
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/26 15:34:30
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.167,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 26 Oct 2020 19:34:35 -0000

Le 24/10/2020 à 07:34, Thomas Huth a écrit :
> On 19/10/2020 18.36, Maxim Levitsky wrote:
>> Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
>> ---
>>  include/hw/qdev-core.h | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
>> index 868973319e..3761186804 100644
>> --- a/include/hw/qdev-core.h
>> +++ b/include/hw/qdev-core.h
>> @@ -163,8 +163,8 @@ struct NamedClockList {
>>  /**
>>   * DeviceState:
>>   * @realized: Indicates whether the device has been fully constructed.
>> - *            When accessed outsize big qemu lock, must be accessed with
>> - *            atomic_load_acquire()
>> + *            When accessed outside big qemu lock, must be accessed with
>> + *            qatomic_load_acquire()
>>   * @reset: ResettableState for the device; handled by Resettable interface.
>>   *
>>   * This structure should not be accessed directly.  We declare it here
>>
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> 
> 
Applied to my trivial-patches branch.

Thanks,
Laurent


