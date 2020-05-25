use warp::Filter;

#[tokio::main]
async fn main() {
    let hello = warp::get()
        .and(warp::path("poke"))
        .map(|| warp::reply::json(&String::from("d")) );
    
    warp::serve(hello)
        .run(([127,0,0,1],9004))
        .await;
}
