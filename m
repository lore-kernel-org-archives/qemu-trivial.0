Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kX80s-00037c-VZ
	for mharc-qemu-trivial@gnu.org; Mon, 26 Oct 2020 15:18:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1kX80r-00034W-GU; Mon, 26 Oct 2020 15:18:37 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:43185)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1kX80o-0008MO-HW; Mon, 26 Oct 2020 15:18:37 -0400
Received: from [192.168.100.1] ([82.252.139.38]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MPXMa-1kjrk62cqo-00Ma0Q; Mon, 26 Oct 2020 20:18:28 +0100
Subject: Re: [PATCH v2] Makefile: Add *.[ch].inc files to cscope/ctags/TAGS
To: Paolo Bonzini <pbonzini@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
References: <160258069310.900922.1495166540282536628.stgit@bahia.lan>
 <a62bfc14-2da7-1e63-0740-7188f82cd89d@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <3187fb3e-1131-3250-0a0c-8b232620bf2d@vivier.eu>
Date: Mon, 26 Oct 2020 20:18:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <a62bfc14-2da7-1e63-0740-7188f82cd89d@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:TIPmRDfmmn6TpbhIuMLV6jNioLKMcfRyF3TmQt3BMDjCtCb3XDW
 rkfrAqH0M+FC3/38CJX6ZmOqXV0uAu+lwzPu3V2/wH51s2n6naqaYuAFw6Yp+CMwZCOzzC5
 vJ+zmaNLhir0cdT5XzsZUZSVBBh/eyVbGWU6FgXIyPe6YZUg3Td5ZpxFV7An3RJ4ap/vA7T
 GLCuBy83iFASn2GOCeLvQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ruQlk53+xus=:fm3kN5KDmRiq9AiH3n+sdW
 CxzqhGhuZISlatmyU8aGObEk3R4hKBrmqNixr3kMPZKhnyWzIX2WWh1iFFobhlucFR5xcgULn
 W98A/WDZYUgEU5SuPm8ddrMQP2VRTE+L7P7IY1J1O2gVv5nFf5QHf9wCLUmHLewe9OnbPXIJ5
 SVzJOIDubqcJ6bZ+P+EIvj1xug8JtoymjdLJkTbDP0Nhc4hjUYUB8cT56LblG6OY0zbeA92/p
 hhLBEil+WdcRUKrE5TyIuGnJarWcCkyPQ+ek8A4SG+nK8L9ob1i2aqP/jtQ6F7l387m6SxvQP
 d7K4HcidqyuQMpt9cg+S5a06CVHhHLgC2tUEAhQA3u03Wo7oydnZPK2fGziq59sKwu63D3awx
 r5OBnNPwe3Yu3kvaIxttT/z7UF6OfbC0nZOHjUTSjcT9HHthvwf9iORK1za5F
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/26 15:18:32
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
X-List-Received-Date: Mon, 26 Oct 2020 19:18:38 -0000

Le 13/10/2020 à 12:57, Paolo Bonzini a écrit :
> On 13/10/20 11:18, Greg Kurz wrote:
>> The code base has some C source and header files that don't get indexed
>> because their name ends with .inc:
>>
>> $ git ls-files "*.[ch].inc" | wc -l
>> 66
>>
>> Add them to the list.
>>
>> Signed-off-by: Greg Kurz <groug@kaod.org>
>> --
>> v2: add the missing \( and \)
>> ---
>>  Makefile |    2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Makefile b/Makefile
>> index c37e513431fe..3c5a0b0f7a11 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -190,7 +190,7 @@ distclean: clean ninja-distclean
>>  	rm -f linux-headers/asm
>>  	rm -Rf .sdk
>>  
>> -find-src-path = find "$(SRC_PATH)/" -path "$(SRC_PATH)/meson" -prune -o -name "*.[chsS]"
>> +find-src-path = find "$(SRC_PATH)/" -path "$(SRC_PATH)/meson" -prune -o \( -name "*.[chsS]" -o -name "*.[ch].inc" \)
>>  
>>  .PHONY: ctags
>>  ctags:
>>
>>
> 
> Cc: qemu-trivial@nongnu.org
> 
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


